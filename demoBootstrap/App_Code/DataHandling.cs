using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataHandling
/// </summary>
public class DataHandling
{
    private static string oradb = ConfigurationSettings.AppSettings["connectionstring"];
    private static OracleConnection conn;
    private static OracleCommand cmd;
    public DataHandling()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static List<string> getProtocolSource()
    {
        List<string> record = new List<string>(); ;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select distinct protocol_source from protocol";
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                record.Add(dr.GetString(0)); //Protocol Source
            }


        }
        catch (Exception e)
        {
            record.Add(e.Message);
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }
        return record;
    }

    
    public static List<string> getProtocolList(string word)
    {
        List<string> record = new List<string>(); ;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select protocol_name from protocol where protocol_source = (:source)";
            cmd.Parameters.Add(new OracleParameter("source", word));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                record.Add(dr.GetString(0)); //Protocol Source
            }


        }
        catch (Exception e)
        {
            record.Add(e.Message);
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }
        return record;
    }

    public static string getProtocolId(string protocolname)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select protocol_id from protocol where protocol_name = (:name)";
            cmd.Parameters.Add(new OracleParameter("name", protocolname));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = Convert.ToString(dr.GetOracleNumber(0));
        }
        catch (Exception e)
        {
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else
            {
                result = e.Message;
            }
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }
    public static string getProtocolName(int protocol_id)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select protocol_name from protocol where protocol_id = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = dr.GetString(0);
        }
        catch (Exception e){
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else{
                result = e.Message;
            }         
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static string getBrand(int protocol_id)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select brand from device_name where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = dr.GetString(0);
        }
        catch (Exception e)
        {
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else
            {
                result = e.Message;
            }
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static string getBilling(int protocol_id)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select charge from billing where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = dr.GetString(0);
        }
        catch (Exception e)
        {
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else
            {
                result = e.Message;
            }
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static string getInstructions(int protocol_id)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select instructions from setup where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = dr.GetString(0);
        }
        catch (Exception e)
        {
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else
            {
                result = e.Message;
            }
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static string getOverview(int protocol_id)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select overview from setup where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = dr.GetString(0);
        }
        catch (Exception e)
        {
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else
            {
                result = e.Message;
            }
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static string getMedicationLink(int protocol_id)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select medication_url from medication where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = dr.GetString(0);
        }
        catch (Exception e)
        {
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else
            {
                result = e.Message;
            }
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }
    public static string getMediaPath(int protocol_id)
    {
        string result;
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select pdf_url from media where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            dr.Read();

            result = dr.GetString(0);
        }
        catch (Exception e)
        {
            if (e.Data.Count == 0)
            {
                result = "None";
            }
            else
            {
                result = e.Message;
            }
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static List<List<string>> getRoutine(int protocol_id)
    {
        List<List<string>> result = new List<List<string>>();
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select * from routine where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                
                List<string> record = new List<string>();
                record.Add(Convert.ToString(dr.GetOracleNumber(0))); //Routine ID
                record.Add(dr.GetString(1)); // Eff Mas
                record.Add(dr.GetString(2)); //Kv
                record.Add(Convert.ToString(dr.GetOracleNumber(3))); // Routine Delay
                record.Add(dr.GetString(4)); // Slice
                record.Add(Convert.ToString(dr.GetOracleNumber(5))); // Dose Notification Value
                record.Add(dr.GetString(6)); //X care
                record.Add(dr.GetString(7)); // Range 4d
                record.Add(Convert.ToString(dr.GetOracleNumber(8))); // Protocol Id Protocol

                result.Add(record);
            }

            
        }
        catch (Exception e)
        {
            List<string> record = new List<string>();
            record.Add(e.Message);
            result.Add(record);
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static List<string> getBolusTracking(int protocol_id)
    {
        List<string> record = new List<string>(); 
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select * from bolus_tracking where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {

                
                record.Add(Convert.ToString(dr.GetOracleNumber(0))); //Bolus Tracking
                record.Add(Convert.ToString(dr.GetOracleNumber(1))); // Mas
                record.Add(Convert.ToString(dr.GetOracleNumber(2))); //Kv
                record.Add(Convert.ToString(dr.GetOracleNumber(3))); // Bolus Delay
                record.Add(Convert.ToString(dr.GetOracleNumber(4))); // Bolus Trigger
                record.Add(Convert.ToString(dr.GetOracleNumber(5))); // Protocol id protocol


                
            }


        }
        catch (Exception e)
        {
            
            record.Add(e.Message);
            
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return record;
    }

    public static List<string> getSetup(int protocol_id)
    {
        List<string> record = new List<string>();
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select * from setup where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                //0:SetupID, 1:Positon, 2: Breathing, 3:Zero Location, 4:Topogram, 5,:ProtocolID,
                //6:Scout ID, 7:Scan Type,8:Scout Length , 9:ProtocolID


                record.Add(Convert.ToString(dr.GetOracleNumber(0))); //Setup ID
                record.Add(dr.GetString(1)); // Position
                record.Add(dr.GetString(2)); //Breathing
                record.Add(dr.GetString(3)); // Zero Location
             //   record.Add(dr.GetString(4)); // Orientation
             //   record.Add(Convert.ToString(dr.GetOracleNumber(5))); // Dose Notification Value
             //   record.Add(Convert.ToString(dr.GetOracleNumber(6))); //Dose alert value
             //   record.Add(dr.GetString(7)); // Instructions
                record.Add(dr.GetString(8)); // Topogram
            //    record.Add(Convert.ToString(dr.GetOracleNumber(9))); //Excel Reference
                record.Add(Convert.ToString(dr.GetOracleNumber(10))); //Protocol Id Protocol   


                
            }

            cmd.CommandText = "select * from scout where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr1 = cmd.ExecuteReader();

            while (dr1.Read())
            {


                record.Add(Convert.ToString(dr1.GetOracleNumber(0))); //Scout ID
                record.Add(dr1.GetString(1)); // Scan Type
               // record.Add(Convert.ToString(dr1.GetOracleNumber(2))); //Scout Kv
              //  record.Add(Convert.ToString(dr1.GetOracleNumber(3)));// Scout ma
              //  record.Add(dr1.GetString(4)); // Scout Direction
             //   record.Add(dr1.GetString(5)); // Scout start
             //   record.Add(dr1.GetString(6)); //Scout end
             //   record.Add(dr1.GetString(7)); // Scout Plane
             //   record.Add(dr1.GetString(8)); // Scout WW WL
             //   record.Add(dr1.GetString(9)); // Scout Kernel
            //    record.Add(dr1.GetString(10)); // Scout Destination
                record.Add(dr1.GetString(11)); //Scout Length
             //   record.Add(Convert.ToString(dr1.GetOracleNumber(12))); //Excel Reference 
                record.Add(Convert.ToString(dr1.GetOracleNumber(13))); //Protocol Id Protocol 
                



            }


        }
        catch (Exception e)
        {
            
            record.Add(e.Message);
            
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return record;
    }

    public static List<List<string>> getScan(int protocol_id)
    {
        List<List<string>> result = new List<List<string>>();
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select * from protocol_scan where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {

                List<string> record = new List<string>();
                record.Add(Convert.ToString(dr.GetOracleNumber(0))); //Scan ID
                record.Add(dr.GetString(1)); // Scan Type
                record.Add(Convert.ToString(dr.GetOracleNumber(2))); //Scan Kv
                record.Add(Convert.ToString(dr.GetOracleNumber(3))); // Scan Ma
                record.Add(Convert.ToString(dr.GetOracleNumber(4))); // Rotation Time
                record.Add(Convert.ToString(dr.GetOracleNumber(5))); // Scan Coverage
                record.Add(Convert.ToString(dr.GetOracleNumber(6))); //Scan Delay
                record.Add(dr.GetString(7)); // Scan Direction
                record.Add(Convert.ToString(dr.GetOracleNumber(8))); // Scan Thickness
                record.Add(Convert.ToString(dr.GetOracleNumber(9))); //Scan Interval
                record.Add(dr.GetString(10)); // Rotation length
                record.Add(dr.GetString(11)); //Detector Coverage
                record.Add(Convert.ToString(dr.GetOracleNumber(12))); // Pitch
                record.Add(Convert.ToString(dr.GetOracleNumber(13))); // Speed
                record.Add(Convert.ToString(dr.GetOracleNumber(14))); //Tilt
                record.Add(dr.GetString(15)); // Sfov
                record.Add(dr.GetString(16)); // Care does4d
                record.Add(dr.GetString(17)); //Care Kv
                record.Add(Convert.ToString(dr.GetOracleNumber(18))); // Dose Optimized Level
                record.Add(dr.GetString(19)); //Dual Energy
                record.Add(dr.GetString(20)); // Hi Res
                record.Add(dr.GetString(21)); // Cardiac
                record.Add(Convert.ToString(dr.GetOracleNumber(22))); // Number of Scans
                record.Add(Convert.ToString(dr.GetOracleNumber(23))); //Feed
                record.Add(Convert.ToString(dr.GetOracleNumber(24))); //Ref ORM
                record.Add(dr.GetString(25)); // Ref Kv
                record.Add(dr.GetString(26)); //Scan Description
                record.Add(dr.GetString(27)); // CTDI Vol
                record.Add(Convert.ToString(dr.GetOracleNumber(28))); //Excel Reference
                record.Add(Convert.ToString(dr.GetOracleNumber(29))); //Protocol Id Protocol   

                result.Add(record);
            }

        }
        catch (Exception e)
        {
            List<string> record = new List<string>();
            record.Add(e.Message);
            result.Add(record);
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static List<List<string>> getReconTab(int protocol_id)
    {
        List<List<string>> result = new List<List<string>>();
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select * from recon_tab where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {

                List<string> record = new List<string>();
                record.Add(Convert.ToString(dr.GetOracleNumber(0))); //Recon ID
                record.Add(dr.GetString(1)); // Description
                record.Add(Convert.ToString(dr.GetOracleNumber(2))); //DFOV
                record.Add(dr.GetString(3)); // AP Center
                record.Add(dr.GetString(4)); // RL Center
                record.Add(Convert.ToString(dr.GetOracleNumber(5))); // THICKNESS
                record.Add(Convert.ToString(dr.GetOracleNumber(6))); //RECON Interval
                record.Add(dr.GetString(7)); // Recon Algorithm
                record.Add(dr.GetString(8)); // WW WL
                record.Add(dr.GetString(9)); //SAFIRE
                record.Add(dr.GetString(10)); // SAFIRE Strength
                record.Add(dr.GetString(11)); // Recon Fast
                record.Add(dr.GetString(12)); // Recon Kernel
                record.Add(dr.GetString(13)); // Recon Slice Data
                record.Add(dr.GetString(14)); //Recon Type
                record.Add(dr.GetString(15)); // Recon Region
                record.Add(dr.GetString(16)); // Recon Axis
                record.Add(dr.GetString(17)); //3D Type
                record.Add(dr.GetString(18)); // Image order
                record.Add(dr.GetString(19)); //ASIR
                record.Add(dr.GetString(20)); //Destinations
                record.Add(Convert.ToString(dr.GetOracleNumber(21))); // INcrements
                record.Add(Convert.ToString(dr.GetOracleNumber(22))); // FOV
                record.Add(Convert.ToString(dr.GetOracleNumber(23))); //Slice
                record.Add(dr.GetString(24)); //Window
                record.Add(dr.GetString(25)); // Noise Supression
                record.Add(Convert.ToString(dr.GetOracleNumber(26))); //Excel Reference
                record.Add(Convert.ToString(dr.GetOracleNumber(27))); //Protocol Id Protocol   

                result.Add(record);
            }

        }
        catch (Exception e)
        {
            List<string> record = new List<string>();
            record.Add(e.Message);
            result.Add(record);
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

    public static List<List<string>> getSeries(int protocol_id)
    {
        List<List<string>> result = new List<List<string>>();
        /*for(int i = 0; i < 4; i++)
        {
            List<string> record = new List<string>();
            for(int j = 0; j < 15; j++)
            {
                record.Add("Value");
            }
            result.Add(record);
        }*/
        try
        {
            conn = new OracleConnection(oradb); // C#
            conn.Open();

            cmd = new OracleCommand();

            cmd.Connection = conn;
            cmd.CommandText = "select * from recon where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {

                List<string> record = new List<string>();
                record.Add(Convert.ToString(dr.GetOracleNumber(0))); //Recon ID
                record.Add(dr.GetString(1)); // Description
                record.Add(Convert.ToString(dr.GetOracleNumber(2))); //DFOV
                record.Add(dr.GetString(3)); // AP Center
                record.Add(dr.GetString(4)); // RL Center
                record.Add(Convert.ToString(dr.GetOracleNumber(5))); // THICKNESS
                record.Add(Convert.ToString(dr.GetOracleNumber(6))); //RECON Interval
                record.Add(dr.GetString(7)); // Recon Algorithm
                record.Add(dr.GetString(8)); // WW WL
                record.Add(dr.GetString(9)); //SAFIRE
                record.Add(dr.GetString(10)); // SAFIRE Strength
                record.Add(dr.GetString(11)); // Recon Fast
                record.Add(dr.GetString(12)); // Recon Kernel
                record.Add(dr.GetString(13)); // Recon Slice Data
                record.Add(dr.GetString(14)); //Recon Type
                record.Add(dr.GetString(15)); // Recon Region
                record.Add(dr.GetString(16)); // Recon Axis
                record.Add(dr.GetString(17)); //3D Type
                record.Add(dr.GetString(18)); // Image order
                record.Add(dr.GetString(19)); //ASIR
                record.Add(dr.GetString(20)); //Destinations
                record.Add(Convert.ToString(dr.GetOracleNumber(21))); // INcrements
                record.Add(Convert.ToString(dr.GetOracleNumber(22))); // FOV
                record.Add(Convert.ToString(dr.GetOracleNumber(23))); //Slice
                record.Add(dr.GetString(24)); //Window
                record.Add(dr.GetString(25)); // Noise Supression
                record.Add(Convert.ToString(dr.GetOracleNumber(26))); //Excel Reference
                record.Add(Convert.ToString(dr.GetOracleNumber(27))); //Protocol Id Protocol   

                result.Add(record);
            }

        }
        catch (Exception e)
        {
            List<string> record = new List<string>();
            record.Add(e.Message);
            result.Add(record);
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

        return result;
    }

}
