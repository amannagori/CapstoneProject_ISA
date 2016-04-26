using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project
{
    public partial class AddEventPage : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            eventDateCalendar.StartDate = DateTime.Now;
        }

        protected void createEvent_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);

            String eventName1 = eventName.Text;
            String eventDate1 = eventDateText.Text;
            String x = eventDate1.Substring(eventDate1.LastIndexOf('/') + 1);
            String eventId1 = eventName1 + x;
            String eventDesc1 = eventDesc.Text;

            //String userid1 = "sdobhal";
            String userid1 = Session["user_id"].ToString();
            Label1.Text = eventId1;

            try
            {
                conn.Open();
                string query = "Insert INTO events (eventId,eventName,eventDesc,eventDate,userId)" +
                                "VALUES(@eventId1,@eventName1,@eventDesc1,@eventDate1,@userid1)";
                SqlCommand sqlCommandEmp = new SqlCommand(query, conn);

                sqlCommandEmp.Parameters.AddWithValue("@eventId1", eventId1);
                sqlCommandEmp.Parameters.AddWithValue("@eventName1", eventName1);
                sqlCommandEmp.Parameters.AddWithValue("@eventDesc1", eventDesc1);
                sqlCommandEmp.Parameters.AddWithValue("@eventDate1", eventDate1);
                sqlCommandEmp.Parameters.AddWithValue("@userid1", userid1);

                sqlCommandEmp.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            ImageUpload(eventId1);

            sendSms();

            Label1.Text = "Event has been created";
            Response.Redirect("Event.aspx");
        }


        protected void ImageUpload(string temp)
        {
            if (imgUpload.PostedFile != null)
            {
                string path = Server.MapPath("~/Images/");
                imgUpload.SaveAs(path + imgUpload.FileName);

                string actualPath = "~/Images/" + imgUpload.FileName;
                SqlConnection conn = new SqlConnection(ISAconnectionString);
                try
                {
                    conn.Open();
                    string strQuery = "Update events SET imagePath = @filePath where eventId = \'" + temp + "\'";
                    SqlCommand cmd = new SqlCommand(strQuery, conn);
                    cmd.Parameters.AddWithValue("@filePath", actualPath);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;

                    cmd.ExecuteNonQuery();

                    Label2.Text = "Image sucessfully uploaded";

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            } // End of if Statement
        }

        private void sendSms()
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            ArrayList list = new ArrayList();

            try
            {
                conn.Open();
                string query = "select * from users where isEventSubs = 'True'";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader userDetails = cmd.ExecuteReader();

                if (userDetails.HasRows)
                {
                    while (userDetails.Read())
                    {
                        string firstName = (string)userDetails["firstName"];
                        string phoneNum = (string)userDetails["phone"];
                        string carrier = (string)userDetails["carrier"];
                        UserDetails ud = new UserDetails(firstName, phoneNum, carrier);
                        list.Add(ud);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            foreach (UserDetails i in list)
            {
                string firstName = i.getfirstName();
                string phoneNum = i.getphoneNum();
                string carrier = i.getcarrier();
                string message = "Hi " + firstName + "! A new event, " + eventName.Text + " has been added in ISA website. To get more details please visit <a href=\"http://www.google.com\">ISA Website</a>";
                if (phoneNum != "")
                {
                    SMSService obj = new SMSService(carrier, phoneNum, message);
                    obj.SendTextMessage(obj);
                }
            }

        }



    }
}