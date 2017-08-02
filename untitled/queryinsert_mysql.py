import mysql.connector
from mysql.connector import Error
import filereadmultiparts as data

def insert_protocol(protocol,con):
    cursor = con.cursor()
    query = "INSERT INTO protocol(protocol_name) VALUES(%s);"
    args = protocol['Name']
    cursor.execute(query,(args,))
    con.commit()
    cursor.close()
    tablename = "protocol"
    display_records(con, tablename)
    print("Record inserted in protocol table.")

def getProtocolid(con):
    cursor = con.cursor()
    query = "SELECT id_protocol FROM protocol ORDER BY id_protocol DESC LIMIT 1;"
    cursor.execute(query)
    id  = cursor.fetchone()[0]
    #print id
    cursor.close()
    return id

def insert_billing(con,charges):
    cursor = con.cursor()
    query = "INSERT INTO billing (charge,protocol_id_protocol) VALUES(%s,%s);"
    args = ( charges['charge'], getProtocolid(con))
    cursor.execute(query,(args))
    con.commit()
    cursor.close()
    tablename = "billing"
    display_records(con, tablename)
    print("Record inserted in billing table")


def insert_bolus_tracking(con, bolus_tracking):
    isBolusTracking = False
    #Check if any of the bolus tracking value is not null.
    for word in bolus_tracking:
        for element in bolus_tracking[word]:
            if element != '':
                print bolus_tracking[word]
                isBolusTracking = True
    #print isBolusTracking
    if isBolusTracking:
        cursor = con.cursor()
        query = "INSERT INTO bolus_tracking (mas,kv,delay,trigger,protocol_id_protocol) VALUES(%s,%s,%s,%s,%s);"
        args = (bolus_tracking['mAs'], bolus_tracking['kV'], bolus_tracking['Delay'], bolus_tracking['Trigger(HU)'],
                getProtocolid(con))
        cursor.execute(query, (args))
        con.commit()
        cursor.close()
        tablename = "bolus_tracking"
        display_records(con, tablename)
    print("Insert into bolus tracking function")

def write_file(data, filename):
    with open(filename, 'wb') as f:
        f.write(data)

def read_file(filename):
    with open(filename, 'rb') as f:
        pdf = f.read()
    return pdf

def insert_media(con, filename):
    data = read_file(filename)
    version = 1
    cursor = con.cursor()
    query = "INSERT INTO media (pdf_document, version,protocol_id_protocol) VALUES(%s,%s,%s);"
    args = (data, version, getProtocolid(con))
    cursor.execute(query, args)
    con.commit()
    cursor.close()
    tablename = "media"
    # display_records(con, tablename)
    print("Record inserted in media table.")

def read_media(con, destinationpath):
    # Read pdf from database.
    cursor = con.cursor()
    query = "SELECT pdf_document FROM media WHERE protocol_id_protocol = %s"
    protocol_id = 9
    cursor.execute(query,(protocol_id,))
    pdf = cursor.fetchone()[0]
    write_file(pdf,destinationpath)
    con.commit()
    cursor.close()
    print("File read and stored in Pictures folder.")



def insert_medication(con, medication):

    isMedication = False
    for word in medication:
        if medication[word] != '':
            print medication[word]
            isMedication = True
    print isMedication
    if isMedication:
        cursor = con.cursor()
        query = "INSERT INTO medication (oral_contrast,oral_contrast_notes,iv_contrast,iv_contrast_notes," \
                "injection_rate,injection_rate_notes,protocol_id_protocol) VALUES(%s,%s,%s,%s,%s,%s,%s);"
        args = (medication['Oral_Contrast'], medication['Oral_Contrast_Note'], medication['IV_Contrast'],
                medication['IV_Notes'], medication['Injection_rate'], medication['Injection_rate_Notes'],
                getProtocolid(con))
        cursor.execute(query, args)
        con.commit()
        cursor.close()
        tablename = "medication"
        display_records(con, tablename)
    pass

def insert_name(con, name1):
    cursor = con.cursor()
    tablename = "name"
    if name1['Number'] == '':
        name1['Number'] =None
    query = "INSERT INTO "+ tablename +"(brand, scanner, number, protocol_id_protocol) VALUES(%s, %s, %s,%s);"
    args = (name1['Brand'], name1['Scanner'], name1['Number'], getProtocolid(con))
    cursor.execute(query, args)
    con.commit()
    cursor.close()
    display_records(con, tablename)



def insert_recon(con, Recon):
    recon = {'Description': [], 'DFOV': [], 'A/P_Center': [], 'R/L_Center': [], 'Thickness': [], 'Interval': [],
             'Algorithm': [], 'WW/WL': [], 'SAFIRE': [], 'SAFIRE_Strength': [], 'FAST': [], 'Recon_Kernel': [],
             'Recon_Slice_Data': [], 'Recon_Type': [], 'Recon_Region': [], 'Recon_Axis': [], '3D_Type': [],
             'Image_Order': [], 'Noise_Supression': [], 'Destinations': [],
             'Slice': [], 'Window': [], 'FoV': [], 'Increment': [], 'Asir': [],'Recon_job_type': []}
    for word in Recon:
        recon[word] = Recon[word]

    maxval = 0
    # Identify maximum number of recon tab.
    for word in recon['Slice']:
        if word == '':
            break
        else:
            maxval += 1
    print maxval
    Recon_int = ['DFOV', 'Thickness', 'Interval',
                 'SAFIRE', 'FAST',
                 'Slice', 'FoV', 'Increment']
    # Set null value reference to None.
    for i in range(1, maxval + 1):
        for word in recon:
            if len(recon[word]) < i:
                if word in Recon_int:
                    recon[word].append(0)
                else:
                    recon[word].append("None")
            # print word
            # print(recon[word])
        print i
    # Setting value of safire as on = 1
    for i in range(len(recon['SAFIRE'])):
        if recon['SAFIRE'][i] != 0 and 'On' in recon['SAFIRE'][i]:
            recon['SAFIRE'][i] = 1
        elif recon['SAFIRE'][i] != 0 and'Off' in recon['SAFIRE'][i]:
            recon['SAFIRE'][i] = 0
        else:
            recon['SAFIRE'][i] = 0
    # print recon['SAFIRE']
    for i in range(len(recon['FAST'])):
        if recon['FAST'][i]!= 0 and 'On' in recon['FAST'][i]:
            recon['FAST'][i] = 1
        elif recon['FAST'][i]!= 0 and'Off' in recon['FAST'][i]:
            recon['FAST'][i] = 0
        else:
            recon['FAST'][i] = 0
    # print recon['FAST']
    for word in recon:
        print(word)
        print( recon[word])
    # Execute query.
    for i in range(maxval):
        cursor = con.cursor()
        query = "INSERT INTO recon (description, dfov, a_p_center, r_l_center, thickness, recon_interval," \
                "recon_algorithm, ww_wl, safire, safire_strength, fast, recon_kernel, recon_slice_data," \
                "recon_type, recon_region, recon_axis, threed_type, image_order, asir,destinations, increments,fov," \
                "slice, window,noise_supression, protocol_id_protocol) VALUES(%s,%s,%s, %s, %s, %s, %s, %s, %s, %s, %s," \
                " %s, %s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        print query
        args = (recon['Description'][i], recon['DFOV'][i], recon['A/P_Center'][i], recon['R/L_Center'][i],
                recon['Thickness'][i], recon['Interval'][i], recon['Algorithm'][i], recon['WW/WL'][i],
                recon['SAFIRE'][i], recon['SAFIRE_Strength'][i], recon['FAST'][i], recon['Recon_Kernel'][i],
                recon['Recon_Slice_Data'][i], recon['Recon_Type'][i], recon['Recon_Region'][i], recon['Recon_Axis'][i],
                recon['3D_Type'][i], recon['Image_Order'][i], recon['Asir'][i], recon['Destinations'][i],
                float(recon['Increment'][i].encode('ascii', 'ignore').split(" ")[0].strip()), recon['FoV'][i],
                float(recon['Slice'][i].encode('ascii', 'ignore').split(" ")[0].strip()), recon['Window'][i],
                recon['Noise_Supression'][i], getProtocolid(con))
        print args
        cursor.execute(query, args)
        con.commit()
        cursor.close()

    tablename = "recon"
    display_records(con, tablename)

def insert_recon_tab(con,recon):
    maxval = 0
    #Identify maximum number of recon tab.
    for word in recon:
        # print(word)
        if len(recon[word]) > maxval:
            maxval = len(recon[word])
        # print(len(recon[word]))
        # print(recon[word])
    print maxval
    Recon_int = [ 'DFOV', 'Thickness', 'Interval',
             'SAFIRE', 'FAST',
             'Slice', 'FoV', 'Increment']
    #Set null value reference to None.
    for i in range(1,maxval+1):
        for word in recon:
            if len(recon[word]) < i:
                if word in Recon_int:
                        recon[word].append(0)
                else:
                    recon[word].append("None")
            print word
            print(recon[word])
        print i
    #Setting value of safire as on = 1
    for i in range(len(recon['SAFIRE'])):
        if 'On' in recon['SAFIRE'][i]:
            recon['SAFIRE'][i] = 1
        else:
            recon['SAFIRE'][i] = 0
    print recon['SAFIRE']
    for i in range(len(recon['FAST'])):
        if 'On' in recon['FAST'][i]:
            recon['FAST'][i] = 1
        else:
            recon['FAST'][i] = 0
    print recon['FAST']
    #Execute query.
    for i in range(maxval):
        cursor = con.cursor()
        query = "INSERT INTO recon_tab (description, dfov, a_p_center, r_l_center, thickness, recon_interval," \
                "recon_algorithm, ww_wl, safire, safire_strength, fast, recon_kernel, recon_slice_data,"\
                "recon_type, recon_region, recon_axis, threed_type, image_order, asir,destinations, increments,fov," \
                "slice, window,noise_supression, protocol_id_protocol) VALUES(%s,%s,%s, %s, %s, %s, %s, %s, %s, %s, %s," \
                " %s, %s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"
        print query
        args = (recon['Description'][i], recon['DFOV'][i], recon['A/P_Center'][i], recon['R/L_Center'][i],
                recon['Thickness'][i], recon['Interval'][i], recon['Algorithm'][i], recon['WW/WL'][i],
                recon['SAFIRE'][i], int(recon['SAFIRE_Strength'][i]), recon['FAST'][i], recon['Recon_Kernel'][i],
                recon['Recon_Slice_Data'][i], recon['Recon_Type'][i], recon['Recon_Region'][i], recon['Recon_Axis'][i],
                recon['3D_Type'][i], recon['Image_Order'][i], recon['Asir'][i], recon['Destinations'][i],
                recon['Increment'][i], recon['FoV'][i], recon['Slice'][i], recon['Window'][i],
                recon['Noise_Supression'][i], getProtocolid(con))
        print args
        cursor.execute(query,args)
        con.commit()
        cursor.close()

    tablename = "recon_tab"
    display_records(con, tablename)


def insert_routine(con, routine):
    Routine = {'Eff_mAs': [], 'kV': [], 'Delay': [], 'Slice': [], 'Dose_Notification_Value': [], 'X-CARE': [],
               '4D_Range(Spital_Shuttle)': []}
    maxval = 0
    # Identify maximum number of recon tab.
    for word in routine:
        # print(word)
        if len(routine[word]) > maxval:
            maxval = len(routine[word])
            # print(len(recon[word]))
            # print(recon[word])
    print maxval
    Routine_int = ['Delay', 'Dose_Notification_Value']
    # Set null value reference to None.
    for i in range(1, maxval + 1):
        for word in routine:
            if len(routine[word]) < i:
                if word in Routine_int:
                    routine[word].append(0)
                else:
                    routine[word].append("None")
            print word
            print(routine[word])
        print i
    #processing integer type parameters
    for i in range(len(routine['Delay'])):
        if routine['Delay'][i] == '':
            routine['Delay'][i] = 0
        else:
            routine['Delay'][i] = routine['Delay'][i].encode('ascii', 'ignore').split(" ")[0].strip()
    print routine['Delay']
    for i in range(len(routine['Dose_Notification_Value'])):
        if routine['Dose_Notification_Value'][i] == '':
            routine['Dose_Notification_Value'][i] = 0
        else:
            routine['Dose_Notification_Value'][i] = \
                routine['Dose_Notification_Value'][i].encode('ascii', 'ignore').split(" ")[0].strip()
    print routine['Dose_Notification_Value']

    #processing boolean parameter
    for i in range(len(routine['X-CARE'])):
        if 'On' in routine['X-CARE'][i]:
            routine['X-CARE'][i] = 1
        else:
            routine['X-CARE'][i] = 0
    print routine['X-CARE']
    #performing insertion operation.
    for i in range(maxval):
        cursor = con.cursor()
        query = "INSERT INTO routine (eff_mas, kv, delay, slice, dose_notification_value, x_care, 4d_range,  " \
                " protocol_id_protocol) VALUES(%s, %s, %s, %s, %s,  %s, %s,  %s);"
        args = (routine['Eff_mAs'][i], routine['kV'][i], int(routine['Delay'][i]), routine['Slice'][i],
                int(routine['Dose_Notification_Value'][i]),routine['X-CARE'][i], routine['4D_Range(Spital_Shuttle)'][i],
                getProtocolid(con))
        print query
        print args
        cursor.execute(query, args)
        con.commit()
        cursor.close()
    tablename = "routine"
    display_records(con, tablename)

def insert_scan(con, scan):
    scan_int = ['kV','mA','Rotation_time', 'Scan_coverage', 'Scan_Delay','Thickness', 'Interval','Detector_coverage',
            'Pitch', 'Speed', 'Tilt', 'Dose_Optimized_level', 'Number_of_scans', 'Feed', 'Ref_QRM', 'Ref_kv' ]
    scan_binary = ['CARE Dose4D', 'CARE_kV','Dual_Energy', 'Hi_Res', 'Cardiac']
    #Identify total number of scans in multipart document.
    maxval = 0
    for word in scan:
        # print(word)
        if len(scan[word]) > maxval:
            maxval = len(scan[word])
            # print(len(recon[word]))
            # print(recon[word])
    print maxval
    #Setting 0 as default value for int and binary data types else None.
    for i in range(1, maxval + 1):
        for word in scan:
            if len(scan[word]) < i:
                if word in scan_int:
                    scan[word].append(0)
                elif word in scan_binary:
                    scan[word].append(0)
                else:
                    scan[word].append("None")
            print word
            print(scan[word])
        print i
    #Setting binary data types as 1 if ON.
    for i in range(maxval):
        for word in scan_binary:
            if scan[word][i] != 0:
                if 'On' in scan[word][i]:
                    scan[word][i] = 1
                else:
                    scan[word][i] = 0
    #Perform query insertion in
    for i in range(maxval):
        cursor = con.cursor()
        query = "INSERT INTO scan (scan_type, kv, ma, rotation_time, scan_coverage, scan_delay, scan_direction, " \
                "thickness, scan_interval,rotation_length,detector_coverage, pitch, speed, tilt, sfov, care_dose4d, " \
                "care_kv, dose_optimized_level,dual_energy, hi_res, cardiac, number_of_scans, feed, ref_qrm, ref_kv," \
                "scan_description, protocol_id_protocol) VALUES(%s, %s, %s, %s, %s,  %s, %s, %s, %s,%s, %s, %s, %s," \
                " %s, %s, %s, %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s );"
        args = (scan['Scan_Type'][i], scan['kV'][i], scan['mA'][i],
                float(scan['Rotation_time'][i].encode('ascii', 'ignore').split(" ")[0].strip()),scan['Scan_coverage'][i],
                scan['Scan_Delay'][i],scan['Scan_Direction'][i],scan['Thickness'][i],scan['Interval'][i],
                scan['Rotation_length'][i], scan['Detector_coverage'][i], float(scan['Pitch'][i]),scan['Speed'][i],
                scan['Tilt'][i],scan['SFOV'][i],scan['CARE Dose4D'][i],scan['CARE_kV'][i],
                int(scan['Dose_Optimized_level'][i]),scan['Dual_Energy'][i],scan['Hi_Res'][i],scan['Cardiac'][i],
                scan['Number_of_scans'][i],scan['Feed'][i],int(scan['Ref_QRM'][i]), int(scan['Ref_kv'][i]),
                scan['Description'][i],getProtocolid(con))
        print query
        print args
        cursor.execute(query, args)
        con.commit()
        cursor.close()
    tablename = "scan"
    display_records(con, tablename)


def insert_scout(con, scout):
    cursor = con.cursor()
    query = "INSERT INTO scout (scan_type, kv, mA, direction, start, end, scout_plane, ww_wl, kernel, destination," \
            " protocol_id_protocol) VALUES(%s, %s, %s, %s, %s,  %s, " \
            " %s,  %s,%s,%s ,%s );"
    if scout['kV'] == '':
        scout['kV'] = 0
    if scout['mA'] == '':
        scout['mA'] = 0
    args = (scout['Scan_Type'], int(scout['kV']),int(scout['mA']),scout['Direction'],scout['Start'],
            scout['End'],scout['Scout_Plane'],scout['WW/WL'],scout['Kernel'],scout['Destination'],
            getProtocolid(con))
    print query
    print args
    cursor.execute(query, args)
    con.commit()
    cursor.close()
    tablename = "scout"
    display_records(con, tablename)

def insert_setup(con, setup):
    cursor = con.cursor()
    query = "INSERT INTO setup (position, breathing, zero_location,orientation,dose_notification_value," \
            "dose_alert_value,instructions, topogram, protocol_id_protocol) VALUES(%s, %s, %s, %s, %s,  %s, " \
            " %s,  %s,%s );"
    args = (setup['Patient_Position'],setup['Breathing_Technique'],setup['Zero_location'],setup['Orientation'],
            setup['Dose_Notification'],setup['Dose_Alert_Value'],setup['Instruction'],setup['Topogram'],
            getProtocolid(con))
    print query
    print args
    cursor.execute(query, args)
    con.commit()
    cursor.close()
    tablename = "setup"
    display_records(con, tablename)



def display_records(con, tablename):
    cursor = con.cursor()
    cursor.execute("SELECT * FROM " + tablename)

    rows = cursor.fetchall()
    print tablename
    print('Total Row(s):', cursor.rowcount)

    for row in rows:
        print(row)