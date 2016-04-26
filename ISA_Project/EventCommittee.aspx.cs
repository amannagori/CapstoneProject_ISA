using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project.PagesCommon
{
    public partial class EventCommittee : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ISAconnectionString);
                try
                {
                    conn.Open();
                    string query = "select * from events";
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
            }
        }

        protected void Datalist1_EventCommand(object source, DataListCommandEventArgs e)
        {
            String eventId = e.CommandArgument.ToString();
            if (e.CommandName == "UpdateEvent")
                Response.Redirect("UpdateEventPageCommittee.aspx?eventId=" + eventId);
            else if (e.CommandName == "DeleteEvent")
                DeleteEvent(eventId);
        }

        private void DeleteEvent(String eventId)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                String query = "Delete from events where eventID = '" + eventId + "' ";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            Response.Redirect("EventCommittee.aspx");
        }

    }
}