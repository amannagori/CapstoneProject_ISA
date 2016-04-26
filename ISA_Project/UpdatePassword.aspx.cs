using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project.CommonPages
{
    public partial class UpdatePassword : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UpdatePassword_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                String query = "Update USERS SET pass = \'" + passwordtxt.Text + "\' ," +
                       " isForgotPass=0 where userId = \'" + Session["user_id"] + "\'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                passUpdated.Text = "Password has been succesfully updated...!!!";
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }
        }
    }
}