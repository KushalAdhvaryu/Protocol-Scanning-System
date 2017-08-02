using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;

/// <summary>
/// Summary description for EditingData
/// </summary>
public class EditingData
{
    private static string oradb = ConfigurationSettings.AppSettings["connectionstring"];
    private static OracleConnection conn;
    private static OracleCommand cmd;
    public EditingData()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    // Sends data reader to bind to drop down list.
    public static OracleDataReader getProtocolNames()
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();
       

        cmd.Connection = conn;
        cmd.CommandText = "select * from protocol where protocol_source = 'word'" ;

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();

        return dr;
    }

    public static OracleDataReader getBilling(List<string> protocolIds)
    {

        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();

        
        cmd.Connection = conn;
        cmd.CommandText = "select * from billing where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();


        return dr;
    }

    public static OracleDataReader getDeviceName(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from device_name where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();

        

        return dr;
    }
    //Converst list of string to query required sting format.
    public static string getListToString(List<string> lstStr)
    {

        string test = "";
        test += "(";
        for (int i = 0; i < lstStr.Count - 1; i++)
        {
            test += lstStr[i] + ", ";
        }
        test += lstStr[lstStr.Count - 1] + ")";

        return test;
    }
}