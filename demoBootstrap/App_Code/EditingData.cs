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
       
      //  cmd.CommandText = "select * from billing where protocol_id_protocol in " + getListToString(protocolIds);
      cmd.CommandText = "select billing.billing_id, protocol.protocol_name, billing.charge from protocol,billing " +
                        "where billing.protocol_id_protocol =protocol.protocol_id and billing.protocol_id_protocol IN " +
                         getListToString(protocolIds) + " order by protocol.protocol_name asc";

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();


        return dr;
    }

    public static OracleDataReader getBolusTracking(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        //  cmd.CommandText = "select * from bolus_Tracking where protocol_id_protocol in " + getListToString(protocolIds);
        cmd.CommandText = "select bolus.bolus_tracking_id, protocol.protocol_name, bolus.mas, bolus.kv, bolus.bolus_delay, bolus.bolus_trigger, bolus.protocol_id_protocol "+ 
                            "from protocol join bolus_tracking bolus on bolus.protocol_id_protocol = protocol.protocol_id where bolus.protocol_id_protocol IN " +
                           getListToString(protocolIds) + " order by protocol.protocol_name asc";
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
        //  cmd.CommandText = "select * from device_name where protocol_id_protocol in " + getListToString(protocolIds);
        cmd.CommandText = "select device.device_name_id, protocol.protocol_name, device.brand, device.scanner, device.device_number, device.protocol_id_protocol " +
                             "from protocol join device_name device on device.protocol_id_protocol = protocol.protocol_id where device.protocol_id_protocol IN " +
                            getListToString(protocolIds) + " order by protocol.protocol_name asc";
        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();

        

        return dr;
    }

    public static OracleDataReader getMedia(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from media where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();



        return dr;
    }

    public static OracleDataReader getMedication(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from medication where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();



        return dr;
    }

    public static OracleDataReader getProtocolScan(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from protocol_scan where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();



        return dr;
    }

    public static OracleDataReader getReconSeries(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from recon where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();

        return dr;
    }
    public static OracleDataReader getReconTab(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from recon_tab where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();

        return dr;
    }
    public static OracleDataReader getRoutine(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from routine where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();

        return dr;
    }
    public static OracleDataReader getScout(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from scout where protocol_id_protocol in " + getListToString(protocolIds);

        cmd.CommandType = CommandType.Text;

        OracleDataReader dr = cmd.ExecuteReader();

        return dr;
    }

    public static OracleDataReader getSetup(List<string> protocolIds)
    {
        conn = new OracleConnection(oradb); // C#
        conn.Open();

        cmd = new OracleCommand();


        cmd.Connection = conn;
        cmd.CommandText = "select * from setup where protocol_id_protocol in " + getListToString(protocolIds);

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