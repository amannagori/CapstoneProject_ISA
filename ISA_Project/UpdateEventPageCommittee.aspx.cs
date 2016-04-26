using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project.PagesCommon
{
    public partial class UpdateEventPageCommittee : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String eventIdQ = Request.QueryString["eventId"];
                Session["eventIdQ"] = Request.QueryString["eventId"];
                SqlConnection conn = new SqlConnection(ISAconnectionString);
                try
                {
                    conn.Open();
                    string query = "select * from events where eventId = '" + eventIdQ + "'";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataReader eventDetails = cmd.ExecuteReader();

                    if (eventDetails.Read())
                    {
                        eventIDText.Text = (String)eventDetails["eventId"];
                        eventName1.Text = (String)eventDetails["eventName"];
                        eventDateText.Text = (String)eventDetails["eventDate"];
                        eventDesc.Text = (String)eventDetails["eventDesc"];
                        imgPath.Src = (String)eventDetails["imagePath"];
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void updateEvent_Click(object sender, EventArgs e)
        {
            String desc = eventDesc.Text;
            String edate = eventDateText.Text;
            String eventIdQ = Session["eventIdQ"].ToString();
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                //String query = "Update EVENTS SET " +
                //    "eventDesc = \'" + desc + "\' ," +
                //    "eventDate = \'" + edate + "\' WHERE eventId=\'" + eventIdQ + "\'";

                //SqlCommand cmd = new SqlCommand(query, conn);
                string query = "Update EVENTS SET eventDesc = @desc, eventDate = @edate" +
                                " WHERE eventId = @eventIdQ";
                SqlCommand sqlCommandEmp = new SqlCommand(query, conn);

                sqlCommandEmp.Parameters.AddWithValue("@eventIdQ", eventIdQ);
                sqlCommandEmp.Parameters.AddWithValue("@edate", edate);
                sqlCommandEmp.Parameters.AddWithValue("@desc", desc);

                //cmd.ExecuteNonQuery();
                sqlCommandEmp.ExecuteNonQuery();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }
            Response.Redirect("EventCommittee.aspx");
        }
    }
}