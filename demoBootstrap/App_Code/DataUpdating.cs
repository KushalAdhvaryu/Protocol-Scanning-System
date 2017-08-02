using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataUpdating
/// </summary>
public class DataUpdating
{
    private static string oradb = ConfigurationSettings.AppSettings["connectionstring"];
    private static OracleConnection conn;
    private static OracleCommand cmd;
    public DataUpdating()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string setBolusTracking(List<string> bolusTracking, int protocol_id)
    {
        string status = "Intial";
        bool toAdd = false;
        foreach(string word in bolusTracking)
        {
            if (word == "None")
                continue;
            else
                toAdd = true;
        }

        if (!toAdd)
        {
            status = "No value has been modified";
            return status;

        }

            
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select count(*) from bolus_tracking where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int count = dr.GetInt32(0);
            if(count == 0)
            {
                OracleCommand getval = new OracleCommand();
                getval.Connection = conn;
                getval.CommandText = "select sequence_bolus_tracking.NEXTVAL from dual";
                getval.CommandType = CommandType.Text;
                status = getval.ExecuteScalar().ToString();
                //       cmd.CommandText = "insert into bolus_tracking(bolus_tracking_id,mas,kv,bolus_delay,bolus_trigger,protocol_id_protocol ) " +
                //            "VALUES (sequence_bolus_tracking.NEXTVAL,:mas,:kv,:delay,:trigger,:protocol_id_protocol)";
                //    cmd.CommandText = "insert into bolus_tracking (bolus_tracking_id,mas,kv,bolus_delay,bolus_trigger,protocol_id_protocol ) VALUES (1,2,3,4,5,6)";
                //     cmd.Parameters.Add(new OracleParameter("mas", bolusTracking[0]));
                //     cmd.Parameters.Add(new OracleParameter("kv", bolusTracking[1]));
                //     cmd.Parameters.Add(new OracleParameter("delay", bolusTracking[2]));
                //     cmd.Parameters.Add(new OracleParameter("trigger", bolusTracking[3]));
                //     cmd.Parameters.Add(new OracleParameter("protocol_id_protocol", protocol_id));
                // cmd.CommandType = CommandType.Text;
              
            //    cmd.ExecuteNonQuery();



              //  status = "Reached here";
                //Write Insert into query here
                

            }
            else
            {
                //Write Update record query here.
            }
           


        }
        catch (Exception e)
        {
            status = e.Message;
        }
        finally
        {
            conn.Close();
            conn.Dispose();

        }

        return status;
    }

}