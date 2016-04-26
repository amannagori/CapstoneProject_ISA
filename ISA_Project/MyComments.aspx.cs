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
    public partial class MyComments : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            itemRepeater.DataSource = getPostComments();
            itemRepeater.DataBind();
        }

        public DataTable getPostComments()
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                //display those categories which user is not subscribed to
                string userid = (string)Session["user_id"];
                //get item data
                String searchString = "select comment.itemId, case when(itemPrice = 0) then '' " +
                         " when(itemPrice != 0) then 'ItemPrice: $' + itemPrice end as itemPrice," +
                         "itemDesc,itemImagePath,items.userId, firstName, lastName, email " +
                                        "from items, users,comment " +
                                        "where items.itemId = comment.itemId and comment.userId = '" +
                                        userid + "' and users.userId ='" + userid + "'"
                                        + " order by itemId desc";


                SqlCommand SQLString = new SqlCommand(searchString, conn);
                SqlDataAdapter da = new SqlDataAdapter(SQLString);
                DataTable dataItem = new DataTable();
                da.Fill(dataItem);
                if (dataItem.Rows.Count == 0)
                    noComments.Visible = true;
                else
                    noComments.Visible = false;
                conn.Close();

                return dataItem;
            }
            catch (SqlException exception)
            {
                //Response.Write("<p>Error code " + exception.Number
                //         + ": " + exception.Message + "</p>");
                throw;
            }
        }

        protected void ItemBound(object sender, RepeaterItemEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                //display those categories which user is not subscribed to
                string userid = (string)Session["user_id"];
                Repeater commentRepeater = (Repeater)e.Item.FindControl("commentRepeater");
                TextBox itemIdBox = e.Item.FindControl("itemId") as TextBox;
                String itemId = itemIdBox.Text;
                //get item data
                String searchString = "select commentId, commentMsg, firstName, lastName " +
                                        "from comment, users " +
                                        "where comment.userId = users.userId and" +
                                        " comment.userId = '" + userid + "' and " +
                                        " comment.itemId = '" + itemId + "';";

                SqlCommand SQLString = new SqlCommand(searchString, conn);
                SqlDataAdapter da = new SqlDataAdapter(SQLString);
                DataTable dataItem = new DataTable();
                da.Fill(dataItem);
                conn.Close();
                commentRepeater.DataSource = dataItem;
                commentRepeater.DataBind();
            }
            catch (SqlException exception)
            {
                //Response.Write("<p>Error code " + exception.Number
                //         + ": " + exception.Message + "</p>");
                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                Button senderId = (Button)sender;
                String commentId = senderId.CommandArgument.ToString();
                conn.Open();
                string query1 = "Delete from comment where commentId = " + commentId;
                SqlCommand cmd = new SqlCommand(query1, conn);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                    + ": " + exception.Message + "</p>");
            }

            // lblStatus.Text = "Item Info successfully deleted";
            conn.Close();
            // itemMultiView.ActiveViewIndex = 0;
            Response.Redirect("MyComments.aspx");
        }
    }
}