using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project.CommonPages
{
    public partial class MyItems : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
     
        protected void Page_Load(object sender, EventArgs e)
        {
        
            string userId = Session["user_id"].ToString();
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ISAconnectionString);
                try
                {
                    conn.Open();
                    string query = "select * from items i join categories c on i.categoryPrefix = c.categoryPrefix where i.userId = \'" + userId + "\'";
                    SqlCommand cmd = conn.CreateCommand();

                    cmd.CommandText = query;
                    cmd.CommandType = CommandType.Text;

                    cmd.Connection = conn;
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                    conn.Close();

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }


            } // End of If statement
        } // End of Page Load method


        protected void Datalist1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ShowItem")
            {
                int itemId = Convert.ToInt32(e.CommandArgument);

                displayItem(itemId);
               
            }
        }

        // Display My Item
        protected void displayItem(int itemId)
        {
            itemMultiView.ActiveViewIndex = 1;
            Session["item_id"] = itemId;
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                String query = "SELECT * FROM items where itemId = @itemID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@itemID", itemId);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    item_Id.Text = dr["itemId"].ToString();
                    itemName.Text = dr["itemName"].ToString();
                    itemDesc.Text = dr["itemDesc"].ToString();
                    itemPrice.Text = dr["itemPrice"].ToString();

                } // end of if statement

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            conn.Close();
        } // End of Display item method


        // Update Item info 
        protected void updateItem_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                String query = "Update items SET itemName = \'" + itemName.Text + "\' , " +
                    " itemDesc =\'"+ itemDesc .Text + "\' , itemPrice = \'" + itemPrice.Text + "\' " +
                    "where itemId = " + Session["item_id"] + " ";


                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }

            lblStatus.Text = "Item Info successfully Updated";

           // userMultiView.ActiveViewIndex = 0;
            conn.Close();
        }


        // delete my item
        protected void deleteItem_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                int i = Convert.ToInt32(Session["item_id"]);
                conn.Open();
                string query1 = "Delete from comment where itemId = " + i;
                SqlCommand cmd = new SqlCommand(query1, conn);
                int b = cmd.ExecuteNonQuery();

             //   if (b >=1)
            //    {
                    string query2 = "Delete from items where itemId = " +i;
                    SqlCommand cmd1 = new SqlCommand(query2, conn);
                    cmd1.ExecuteNonQuery();
            //    }


            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }

            // lblStatus.Text = "Item Info successfully deleted";
            conn.Close();
            // itemMultiView.ActiveViewIndex = 0;
            Response.Redirect("MyItems.aspx");
        }
    }
}