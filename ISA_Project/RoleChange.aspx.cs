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

     public partial class RoleChange : System.Web.UI.Page
    {
      string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateUserGrid();
            }
        }

        void populateUserGrid()
        {
            //userMultiView.ActiveViewIndex = 1;
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                //dbConnection.ChangeDatabase("nasa_SilentAuction_v1");
                String query = "SELECT * FROM USERS";
                SqlCommand pendingList = new SqlCommand(query, conn);

                DataTable table = new DataTable();
                SqlDataReader pendingListDisplay = pendingList.ExecuteReader();

                table.Columns.Add("User Id");
                table.Columns.Add("Email");
                table.Columns.Add("First Name");
                table.Columns.Add("Last Name");
                table.Columns.Add("Associated Role");
               
                while (pendingListDisplay.Read())
                {
                    DataRow row = table.NewRow();
                    row["User Id"] = pendingListDisplay["userId"];
                    row["Email"] = pendingListDisplay["email"];
                    row["First Name"] = pendingListDisplay["firstName"];
                    row["Last Name"] = pendingListDisplay["lastName"];
                    row["Associated Role"] = pendingListDisplay["roles"];
                    table.Rows.Add(row);
                }

                //table.Load(pendingListDisplay);
                roleChangeGrid.DataSource = table;
                roleChangeGrid.DataBind();

                conn.Close();

            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }
        } // End of Populate User Method



        void addDropdown(object sender, GridViewRowEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            String query = "SELECT distinct roles FROM USERS";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader ddlValues = cmd.ExecuteReader();

            if (e.Row.RowType == DataControlRowType.DataRow)

            {
                DropDownList ddList = (DropDownList)e.Row.FindControl("ddl_roles");
                ddList.DataSource = ddlValues;
                ddList.DataTextField = "roles";
                ddList.DataBind();
            }
        }


        // Grid Vew Method
        protected void RoleChange_Command(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View User")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = roleChangeGrid.Rows[index];
                String uidSelected = row.Cells[0].Text;               
                changeUserRole(uidSelected);
            }

        }

        void changeUserRole(string userIdSelected)
        {
            userMultiView.ActiveViewIndex = 1;
            Session["userid"] = userIdSelected;
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                String query = "SELECT * FROM USERS where userId = @userID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@userID", userIdSelected);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    userid.Text = dr["userId"].ToString();
                    fname.Text = dr["firstName"].ToString();
                    lname.Text = dr["lastName"].ToString();
                    email.Text = dr["email"].ToString();
                    ddl_roles.Text = dr["roles"].ToString();
                } // end of if statement
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }
            conn.Close();
        }  // end of changeUserRole Method


        protected void UpdateRole(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                String query = "Update USERS SET roles = \'" + ddl_roles.SelectedValue + "\' where userId = \'" + Session["userid"] + "\'";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                roleChange.Text = "Role Updated..!!";
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }

            populateUserGrid();
            userMultiView.ActiveViewIndex = 0;
            conn.Close();
        } // end of UpdateRole statement


    }
}