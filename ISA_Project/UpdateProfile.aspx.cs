using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        private SMSService textMessage;

        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string str_userid = Convert.ToString(Session["user_id"]);
                txtuser.Text = str_userid;

                DataTable dt = new DataTable();
                SqlConnection connection = new SqlConnection(ISAconnectionString);

                connection.Open();
                string query = "SELECT * from users WHERE userId = '"+ str_userid+"'";
                SqlCommand checkIDTable = new SqlCommand(query, connection);

                SqlDataReader idRecords = checkIDTable.ExecuteReader();
                if (idRecords.Read())
                {
                    do
                    {
                        txtfirst.Text = idRecords["firstName"].ToString();
                        txtlast.Text = idRecords["lastName"].ToString();
                        txtphone.Text = idRecords["phone"].ToString();
                        DropDownList1.SelectedValue = idRecords["carrier"].ToString();
                        txtemail.Text = idRecords["email"].ToString();
                        CheckBox1.Checked = Convert.ToBoolean(idRecords["isEventSubs"]);
                           

                        string password = idRecords["pass"].ToString();
                        txtpassword.Attributes.Add("value", password);
                        txtconfirm.Attributes.Add("value", password);

                        string str = idRecords["gradDate"].ToString();

                        if (str != "")
                        {
                            string[] words = str.Split(' ');

                            for (int i = 0; i < words.Length; i++)
                            {
                                DropDownList2.SelectedValue = words[0];
                                txtyear.Text = words[1];
                            }
                        }
                    }
                    while (idRecords.Read());
                }
                idRecords.Close();

                connection.Close();
            }
        }
        
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ISAconnectionString);

            try
            {
                string userid = Convert.ToString(Session["user_id"]);
                txtuser.Text = userid;
                string first = Convert.ToString(txtfirst.Text);
                string last = Convert.ToString(txtlast.Text);
                string password = Convert.ToString(txtpassword.Text);
                string confirm = Convert.ToString(txtconfirm.Text);
                string email = Convert.ToString(txtemail.Text);
                string phone = Convert.ToString(txtphone.Text);
                string carrier = Convert.ToString(DropDownList1.SelectedValue);
                string gradDate = DropDownList2.SelectedValue + ' ' + txtyear.Text;
                bool isEventSubs = CheckBox1.Checked;

                connection.Open();


                string SQLString1 = "UPDATE users SET firstName=@fname, lastName=@lname, "+
                   " pass=@password, email=@email, phone=@phone, gradDate= @gradDate, carrier=@carrier, isEventSubs=@isEventSubs" + 
                    " WHERE userId = @userid";


                SqlCommand com1 = new SqlCommand(SQLString1, connection);
                com1.Parameters.AddWithValue("@fname", first);
                com1.Parameters.AddWithValue("@lname", last);
                com1.Parameters.AddWithValue("@password", password);
                com1.Parameters.AddWithValue("@email", email);
                com1.Parameters.AddWithValue("@phone", phone);
                com1.Parameters.AddWithValue("@userid", userid);
                com1.Parameters.AddWithValue("@gradDate", gradDate);
                com1.Parameters.AddWithValue("@carrier", carrier);
                com1.Parameters.AddWithValue("@isEventSubs", isEventSubs);

                int rowAffected = com1.ExecuteNonQuery();
                if (rowAffected == 1)
                {
                    if (phone != "")
                    {
                        string message = "Thank you!! Your profile has been updated successfully";
                        textMessage = new SMSService(carrier, phone, message);
                        textMessage.SendTextMessage(textMessage);
                        update.Text = "Profile updated successfully...!!";
                        //Response.Redirect("Home.aspx");
                    }
                    else
                        update.Text = "Profile updated successfully...!!";
                }
         
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }
            connection.Close();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtphone.Enabled = true;
        }
    }
}