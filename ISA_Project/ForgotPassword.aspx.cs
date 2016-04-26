using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project.CommonPages
{
   
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private SMSService textMessage;
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendEmail(object sender, EventArgs e)
        {
            string ran_pass = RandomPasswordGenerator();
            string email_add = txtEmail.Text;
            string phn_carrier=null;
            string phn_num = null;

            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                string query1 = "select * from users where email = '" + email_add+"'";
                SqlCommand cmd1 = new SqlCommand(query1, conn);
                SqlDataReader idRecords = cmd1.ExecuteReader();

                if(idRecords.Read())
                {
                    phn_carrier = idRecords["carrier"].ToString();
                    phn_num = idRecords["phone"].ToString();
                    conn.Close();
                }

                SqlConnection conn1 = new SqlConnection(ISAconnectionString);
                conn1.Open();
                String query = "Update USERS SET pass = \'" + ran_pass + "\' ,"+
                                  " isForgotPass = 1 where email = \'" + email_add + "\'";
                SqlCommand cmd = new SqlCommand(query, conn1);
                cmd.ExecuteNonQuery();

                if (!string.IsNullOrEmpty(ran_pass))
                {


                    //MailMessage mailMessage = new MailMessage();
                    //mailMessage.To.Add(email_add);
                    //mailMessage.From = new MailAddress("anagori@ilstu.edu");
                    //mailMessage.Subject = "Password Recovery Email";


                    //// MailMessage mm = new MailMessage("sender@gmail.com", txtEmail.Text.Trim());
                    //// mm.Subject = "Password Recovery";
                    //mailMessage.Body = "<html><body></body></html>" + "<br/>Hello " +
                    //                    ",<br/><br/> Your Password is: " + ran_pass;


                    //AlternateView htmlView = AlternateView.CreateAlternateViewFromString(
                    // mailMessage.Body, null, "text/html");
                    //mailMessage.AlternateViews.Add(htmlView);


                    //SmtpClient smtpClient = new SmtpClient();
                    //smtpClient.UseDefaultCredentials = true;
                    //smtpClient.Send(mailMessage);

                    //lblMessage.ForeColor = Color.Green;
                    //lblMessage.Text = " Password is sent to your Email. Please check the same!";
                    string message = "Access code is "+ ran_pass+ " ,Please Login and use this code to update password";
                    textMessage = new SMSService(phn_carrier, phn_num, message);
                    textMessage.SendTextMessage(textMessage);
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Temporary password sent successfully...!!";

                }
                else
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "This email address does not match our records.";
                }

            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                         + ": " + exception.Message + "</p>");

            }
        }  // End of SendEmail Method

        protected string RandomPasswordGenerator()
        {
            Random random = new Random();
            string characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder result = new StringBuilder(10);
            for (int i = 0; i < 10; i++)
            {
                result.Append(characters[random.Next(characters.Length)]);
            }
            return result.ToString();
    
        }  // End o fRandom Password Method


    }
}