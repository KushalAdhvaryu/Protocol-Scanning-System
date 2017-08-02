import mysql.connector
from mysql.connector import Error
import filereadmultiparts as data
import re

def insert_protocol(protocol,con,source):
    cursor = con.cursor()

    seq_query = "Select sequence_protocol.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_index = cursor.fetchone()[0]
    query = "INSERT INTO protocol VALUES(:protocol_id,:protocol_name,:protocol_source)"
    args = {'protocol_id':id_index,'protocol_name':protocol['Name'],'protocol_source':source}
    cursor.execute(query,args)
    con.commit()
    cursor.close()

    tablename = "protocol"
    display_records(con, tablename)
    print("Record inserted in protocol table.")

def getProtocolid(con):
    cursor = con.cursor()
    query = "SELECT protocol_id FROM ( SELECT protocol_id FROM protocol ORDER BY protocol_id DESC) WHERE ROWNUM = 1"
    cursor.execute(query)
    id  = cursor.fetchone()[0]
    print id
    cursor.close()
    return id

def insert_billing(con,charges):
    cursor = con.cursor()
    seq_query = "Select sequence_billing.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_index = cursor.fetchone()[0]
    query = "INSERT INTO billing VALUES (:billing_id,:charge,:protocol_id_protocol)"
    args = {'billing_id':id_index,'charge':' '.join(charges['charge'].split()),'protocol_id_protocol':getProtocolid(con)}
    cursor.execute(query, args)
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
    # print isBolusTracking
    if isBolusTracking:
        cursor = con.cursor()
        seq_query = "Select sequence_bolus_tracking.NEXTVAL From dual"
        cursor.execute(seq_query)
        id_index = cursor.fetchone()[0]
        query = "INSERT INTO bolus_tracking VALUES (:bolus_tracking_id,:mas,:kv,:delay,:trigger,:protocol_id_protocol) "
        args = {'bolus_tracking_id': id_index,'mas':bolus_tracking['mAs'],'kv':bolus_tracking['kV'],
                'delay':bolus_tracking['Delay'],'trigger':bolus_tracking['Trigger(HU)'],
                'protocol_id_protocol':getProtocolid(con)}
        cursor.execute(query, args)
        con.commit()
        cursor.close()
        tablename = "bolus_tracking"
        display_records(con, tablename)
        print("Insert into bolus tracking function")
    else:
        print ("Bolus Tracking Data is Empty")



def insert_media(con, filename, protocol):
    version = 1
    cursor = con.cursor()

    seq_query = "Select sequence_media.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_index = cursor.fetchone()[0]

    query = "INSERT INTO media VALUES (:media_id,:pdf_document, :pdf_version,:pdf_url,:protocol_id_protocol)"
    args = {'media_id':id_index,'pdf_document':protocol['Name'], 'pdf_version':version,'pdf_url':filename,
            'protocol_id_protocol':getProtocolid(con)}
    test = (0,filename, version, getProtocolid(con))
    cursor.execute(query, args)
    con.commit()
    cursor.close()
    tablename = "media"
    display_records(con, tablename)
    print("Record inserted in media table.")


def insert_medication(con, medication):

    isMedication = False
    # Check if medication has any data since it can be null.
    for word in medication:
        if medication[word] != '':
            print medication[word]
            isMedication = True
    print isMedication
    if isMedication:
        cursor = con.cursor()

        seq_query = "Select sequence_device_name.NEXTVAL From dual"
        cursor.execute(seq_query)
        id_index = cursor.fetchone()[0]

        query = "INSERT INTO medication VALUES (:medication_id,:oral_contrast,:oral_contrast_notes,:iv_contrast," \
                ":iv_contrast_notes,:injection_rate,:injection_rate_notes,:medication_url,:protocol_id_protocol)"
        args = {'medication_id':id_index,'oral_contrast':medication['Oral_Contrast'],
                'oral_contrast_notes':medication['Oral_Contrast_Note'],'iv_contrast':medication['IV_Contrast'],
                'iv_contrast_notes':medication['IV_Notes'],'injection_rate':medication['Injection_rate'],
                'injection_rate_notes':medication['Injection_rate_Notes'], 'medication_url': 'https://www.google.com',
                'protocol_id_protocol':getProtocolid(con)}
        cursor.execute(query, args)
        con.commit()
        cursor.close()
        tablename = "medication"
        display_records(con, tablename)
    else:
        print("No data to insert in medication")

def insert_name(con, name1):

    # To check if parameters are Null, then Set default None or 0.
    if name1['Number'] == '':
        name1['Number'] = 0
    if name1['Scanner'] == '':
        name1['Scanner'] = "None"

    cursor = con.cursor()

    seq_query = "Select sequence_device_name.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_index = cursor.fetchone()[0]

    query = "INSERT INTO device_name VALUES (:device_name_id,:brand, :scanner, :device_number, :protocol_id_protocol)"
    args = {'device_name_id':id_index,'brand':name1['Brand'], 'scanner':name1['Scanner'],
            'device_number':name1['Number'], 'protocol_id_protocol':getProtocolid(con)}
    cursor.execute(query, args)
    con.commit()
    cursor.close()

    tablename = "device_name"
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
            recon['SAFIRE'][i] = "On"
        elif recon['SAFIRE'][i] != 0 and'Off' in recon['SAFIRE'][i]:
            recon['SAFIRE'][i] = "Off"
        else:
            recon['SAFIRE'][i] = "Off"
    # print recon['SAFIRE']
    for i in range(len(recon['FAST'])):
        if recon['FAST'][i]!= 0 and 'On' in recon['FAST'][i]:
            recon['FAST'][i] = "On"
        elif recon['FAST'][i]!= 0 and'Off' in recon['FAST'][i]:
            recon['FAST'][i] = "Off"
        else:
            recon['FAST'][i] = "Off"
    # print recon['FAST']
    for word in recon:
        print(word)
        print( recon[word])
    # Execute query.
    for i in range(maxval):
        cursor = con.cursor()

        seq_query = "Select sequence_recon.NEXTVAL From dual"
        cursor.execute(seq_query)
        id_index = cursor.fetchone()[0]

        query = "INSERT INTO recon  VALUES (:recon_id, :description, :dfov, :a_p_center, :r_l_center, :thickness, " \
                ":recon_interval, :recon_algorithm, :ww_wl, :safire, :safire_strength, :recon_fast, :recon_kernel, " \
                ":recon_slice_data, :recon_type, :recon_region, :recon_axis, :threed_type, :image_order, :asir, " \
                ":destinations, :increments,:fov, :slice, :window,:noise_supression,:excel_reference, " \
                ":protocol_id_protocol)"
        print query
        # test = (3,recon['Description'][i], recon['DFOV'][i], recon['A/P_Center'][i], recon['R/L_Center'][i],
        #         recon['Thickness'][i], recon['Interval'][i], recon['Algorithm'][i], recon['WW/WL'][i],
        #         recon['SAFIRE'][i], recon['SAFIRE_Strength'][i], recon['FAST'][i], recon['Recon_Kernel'][i],
        #         recon['Recon_Slice_Data'][i], recon['Recon_Type'][i], recon['Recon_Region'][i], recon['Recon_Axis'][i],
        #         recon['3D_Type'][i], recon['Image_Order'][i], recon['Asir'][i], recon['Destinations'][i],
        #         float(recon['Increment'][i].encode('ascii', 'ignore').split(" ")[0].strip()), recon['FoV'][i],
        #         float(recon['Slice'][i].encode('ascii', 'ignore').split(" ")[0].strip()), recon['Window'][i],
        #         recon['Noise_Supression'][i],0, getProtocolid(con))
        # print test
        args = {'recon_id':id_index, 'description': recon['Description'][i], 'dfov':recon['DFOV'][i],
                'a_p_center':recon['A/P_Center'][i], 'r_l_center':recon['R/L_Center'][i],
                'thickness':recon['Thickness'][i],'recon_interval':recon['Interval'][i],
                'recon_algorithm':recon['Algorithm'][i], 'ww_wl':recon['WW/WL'][i], 'safire':recon['SAFIRE'][i],
                'safire_strength':recon['SAFIRE_Strength'][i], 'recon_fast':recon['FAST'][i],
                'recon_kernel':recon['Recon_Kernel'][i], 'recon_slice_data':recon['Recon_Slice_Data'][i],
                'recon_type':recon['Recon_Type'][i],'recon_region':recon['Recon_Region'][i],
                'recon_axis':recon['Recon_Axis'][i], 'threed_type':recon['3D_Type'][i],
                'image_order':recon['Image_Order'][i], 'asir':recon['Asir'][i],'destinations':recon['Destinations'][i],
                'increments':float(recon['Increment'][i].encode('ascii', 'ignore').split(" ")[0].strip()),
                'fov':recon['FoV'][i], 'slice': float(recon['Slice'][i].encode('ascii', 'ignore').split(" ")[0].strip()),
                'window':recon['Window'][i],'noise_supression': recon['Noise_Supression'][i],'excel_reference':0,
                'protocol_id_protocol':getProtocolid(con)}

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
            recon['SAFIRE'][i] = "On"
        else:
            recon['SAFIRE'][i] = "Off"
    print recon['SAFIRE']
    for i in range(len(recon['FAST'])):
        if 'On' in recon['FAST'][i]:
            recon['FAST'][i] = "On"
        else:
            recon['FAST'][i] = "Off"
    print recon['FAST']
    #Execute query.
    for i in range(maxval):
        cursor = con.cursor()

        seq_query = "Select sequence_recon_tab.NEXTVAL From dual"
        cursor.execute(seq_query)
        id_index = cursor.fetchone()[0]

        query = "INSERT INTO recon_tab VALUES(:recon_id, :description, :dfov, :a_p_center, :r_l_center, :thickness, " \
                ":recon_interval, :recon_algorithm, :ww_wl, :safire, :safire_strength, :recon_fast, :recon_kernel, " \
                ":recon_slice_data, :recon_type, :recon_region, :recon_axis, :threed_type, :image_order, :asir, " \
                ":destinations, :increments,:fov, :slice, :window,:noise_supression,:excel_reference, " \
                ":protocol_id_protocol)"
        print query
        args = {'recon_id': id_index, 'description': recon['Description'][i], 'dfov': recon['DFOV'][i],
                'a_p_center': recon['A/P_Center'][i], 'r_l_center': recon['R/L_Center'][i],
                'thickness': recon['Thickness'][i], 'recon_interval': recon['Interval'][i],
                'recon_algorithm': recon['Algorithm'][i], 'ww_wl': recon['WW/WL'][i], 'safire': recon['SAFIRE'][i],
                'safire_strength': recon['SAFIRE_Strength'][i], 'recon_fast': recon['FAST'][i],
                'recon_kernel': recon['Recon_Kernel'][i], 'recon_slice_data': recon['Recon_Slice_Data'][i],
                'recon_type': recon['Recon_Type'][i], 'recon_region': recon['Recon_Region'][i],
                'recon_axis': recon['Recon_Axis'][i], 'threed_type': recon['3D_Type'][i],
                'image_order': recon['Image_Order'][i], 'asir': recon['Asir'][i],
                'destinations': recon['Destinations'][i], 'increments': recon['Increment'][i],'fov': recon['FoV'][i],
                'slice': recon['Slice'][i], 'window': recon['Window'][i],
                'noise_supression': recon['Noise_Supression'][i], 'excel_reference': 0,
                'protocol_id_protocol': getProtocolid(con)}
        print args
        cursor.execute(query,args)
        con.commit()
        cursor.close()

    tablename = "recon_tab"
    display_records(con, tablename)


def insert_routine(con, routine):

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
    for i in range(len(routine['4D_Range(Spital_Shuttle)'])):
        if routine['4D_Range(Spital_Shuttle)'][i] == '':
            routine['4D_Range(Spital_Shuttle)'][i] = "None"


    for i in range(len(routine['Dose_Notification_Value'])):
        if routine['Dose_Notification_Value'][i] == '':
            routine['Dose_Notification_Value'][i] = 0
        else:
            routine['Dose_Notification_Value'][i] = \
                routine['Dose_Notification_Value'][i].encode('ascii', 'ignore').split(" ")[0].strip()
    print routine['Dose_Notification_Value']

    #processing boolean parameter
    # for i in range(len(routine['X-CARE'])):
    #     if 'On' in routine['X-CARE'][i]:
    #         routine['X-CARE'][i] = 1
    #     else:
    #         routine['X-CARE'][i] = 0
    # print routine['X-CARE']
    #performing insertion operation.
    for i in range(maxval):
        cursor = con.cursor()

        seq_query = "Select sequence_routine.NEXTVAL From dual"
        cursor.execute(seq_query)
        id_index = cursor.fetchone()[0]

        query = "INSERT INTO routine  VALUES(:routine_id, :eff_mas, :kv, :routine_delay, :slice, " \
                ":dose_notification_value,:x_care, :range_4d, :protocol_id_protocol)"
        args = {'routine_id':id_index, 'eff_mas':routine['Eff_mAs'][i], 'kv':routine['kV'][i],
                'routine_delay':int(routine['Delay'][i]), 'slice':"abc",
                'dose_notification_value':int(routine['Dose_Notification_Value'][i]),'x_care':str(routine['X-CARE'][i]),
                'range_4d':routine['4D_Range(Spital_Shuttle)'][i], 'protocol_id_protocol':getProtocolid(con)}
        test = (routine['Eff_mAs'][i], routine['kV'][i], int(routine['Delay'][i]), routine['Slice'][i],
                int(routine['Dose_Notification_Value'][i]),str(routine['X-CARE'][i]), routine['4D_Range(Spital_Shuttle)'][i],
                getProtocolid(con))
        print test
        print query
        print args
        cursor.execute(query, args)
        con.commit()
        cursor.close()
    tablename = "routine"
    display_records(con, tablename)

def insert_scan(con, scan):
    scan_int = ['kV','mA','Rotation_time', 'Scan_coverage', 'Scan_Delay','Thickness', 'Interval',
            'Pitch', 'Speed', 'Tilt', 'Dose_Optimized_level', 'Number_of_scans', 'Feed', 'Ref_QRM' ]
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
                else:
                    scan[word].append("None")
            print word
            print(scan[word])
        print i
    #sett default values for null int.
    for word in scan_int:
        for i in range(len(scan[word])):
            if scan[word][i] == '':
                scan[word][i] = 0
        print scan[word]
    for i in range(maxval):
        if scan['Scan_Delay'][i] != 0:
            scan['Scan_Delay'][i] = scan['Scan_Delay'][i].encode('ascii', 'ignore').split(" ")[0].strip()

    #Setting binary data types as 1 if ON.
    for i in range(maxval):
        for word in scan_binary:
            if scan[word][i] != 0:
                if 'On' in scan[word][i]:
                    scan[word][i] = scan[word][i].encode('ascii','ignore')
                elif 'ff' in scan[word][i]:
                    scan[word][i] = scan[word][i].encode('ascii', 'ignore')
                else:
                    scan[word][i] = "Off"
    #Perform query insertion in

    # #Fix for test5 docx need o confirm how to handle this.
    # scan['Ref_kv'][0] = ''.join(scan['Ref_kv'][0].split("\n")[0])
    # print scan['Ref_kv'][0]
        # if re.search('[a-zA-Z]', scan['Ref_kv'][i]) != None:
        #     scan['Ref_kv'][i] = scan['Ref_kv'][i].split(" ")[0]

    for i in range(maxval):
        cursor = con.cursor()

        seq_query = "Select sequence_protocol_scan.NEXTVAL From dual"
        cursor.execute(seq_query)
        id_index = cursor.fetchone()[0]

        query = "INSERT INTO protocol_scan  VALUES(:scan_id, :scan_type, :scan_kv, :scan_ma, :rotation_time, " \
                ":scan_coverage, :scan_delay, :scan_direction, :scan_thickness, :scan_interval,:rotation_length," \
                ":detector_coverage, :pitch, :speed, :tilt, :sfov, :care_dose4d, :care_kv, :dose_optimized_level," \
                ":dual_energy, :hi_res, :cardiac, :number_of_scans, :feed, :ref_qrm, :ref_kv,:scan_description," \
                ":ctdivol,:excel_reference ,:protocol_id_protocol)"
        args = {'scan_id':id_index, 'scan_type':scan['Scan_Type'][i], 'scan_kv':scan['kV'][i], 'scan_ma':scan['mA'][i],
                'rotation_time':float(scan['Rotation_time'][i].encode('ascii', 'ignore').split(" ")[0].strip()),
                'scan_coverage':scan['Scan_coverage'][i], 'scan_delay':scan['Scan_Delay'][i],
                'scan_direction':scan['Scan_Direction'][i], 'scan_thickness':scan['Thickness'][i],
                'scan_interval':scan['Interval'][i],'rotation_length':scan['Rotation_length'][i],
                'detector_coverage':str(scan['Detector_coverage'][i]), 'pitch':float(scan['Pitch'][i]),
                'speed':scan['Speed'][i],'tilt':scan['Tilt'][i], 'sfov':scan['SFOV'][i],
                'care_dose4d':scan['CARE Dose4D'][i], 'care_kv':scan['CARE_kV'][i],
                'dose_optimized_level':int(scan['Dose_Optimized_level'][i]),'dual_energy':scan['Dual_Energy'][i],
                'hi_res':scan['Hi_Res'][i], 'cardiac':scan['Cardiac'][i], 'number_of_scans':scan['Number_of_scans'][i],
                'feed':scan['Feed'][i], 'ref_qrm':int(scan['Ref_QRM'][i]), 'ref_kv':str(scan['Ref_kv'][i]),
                'scan_description':scan['Description'][i],'ctdivol':"None",'excel_reference': 0,
                'protocol_id_protocol':getProtocolid(con)}
        test = (2,scan['Scan_Type'][i], scan['kV'][i], scan['mA'][i],
                float(scan['Rotation_time'][i].encode('ascii', 'ignore').split(" ")[0].strip()),scan['Scan_coverage'][i],
                scan['Scan_Delay'][i],scan['Scan_Direction'][i],scan['Thickness'][i],scan['Interval'][i],
                scan['Rotation_length'][i], scan['Detector_coverage'][i], float(scan['Pitch'][i]),scan['Speed'][i],
                scan['Tilt'][i],scan['SFOV'][i],scan['CARE Dose4D'][i],scan['CARE_kV'][i],
                int(scan['Dose_Optimized_level'][i]),scan['Dual_Energy'][i],scan['Hi_Res'][i],scan['Cardiac'][i],
                scan['Number_of_scans'][i],scan['Feed'][i],int(scan['Ref_QRM'][i]), scan['Ref_kv'][i],
                scan['Description'][i],"None",0,getProtocolid(con))
        print test
        print query
        print args
        cursor.execute(query, args)
        con.commit()
        cursor.close()
    tablename = "protocol_scan"
    display_records(con, tablename)


def insert_scout(con, scout):
    scout_notnull = ['kV','mA','Start','End','Scout_Plane']
    for word in scout_notnull:
        if scout[word] == '':
            scout[word] = 0
    scout_varnotnull = ['Destination','Scan_Type']
    for word in scout_varnotnull:
        if scout[word] == '':
            scout[word] = "None"

    cursor = con.cursor()

    seq_query = "Select sequence_scout.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_index = cursor.fetchone()[0]

    query = "INSERT INTO scout  VALUES(:scout_id,:scan_type, :scout_kv, :scout_mA, :scout_direction, :scout_start, " \
            ":scout_end, :scout_plane, :scout_ww_wl, :scout_kernel, :scout_destination,:scout_length," \
            ":excel_reference,:protocol_id_protocol)"
    args = {'scout_id':id_index,'scan_type':scout['Scan_Type'], 'scout_kv':int(scout['kV']),
            'scout_mA':int(scout['mA']), 'scout_direction':scout['Direction'], 'scout_start':scout['Start'],
            'scout_end':scout['End'],'scout_plane':scout['Scout_Plane'], 'scout_ww_wl':scout['WW/WL'],
            'scout_kernel':scout['Kernel'], 'scout_destination':scout['Destination'],
            'scout_length':scout['Scout_length'],'excel_reference':0,'protocol_id_protocol':getProtocolid(con),}
    test = (0,scout['Scan_Type'], int(scout['kV']),int(scout['mA']),scout['Direction'],scout['Start'],
            scout['End'],scout['Scout_Plane'],scout['WW/WL'],scout['Kernel'],scout['Destination'],0, getProtocolid(con))
    print query
    print args
    cursor.execute(query, args)
    con.commit()
    cursor.close()
    tablename = "scout"
    display_records(con, tablename)

def insert_setup(con, setup, protocol):
    setup_notnull = ['Patient_Position','Breathing_Technique','Zero_location','Orientation','Instruction','Topogram',
                     ]
    for word in setup_notnull:
        if setup[word] == '':
            setup[word] = "None"
    if setup['Dose_Notification'] == '':
        setup['Dose_Notification'] = 0
    if setup['Dose_Alert_Value'] == '':
        setup['Dose_Alert_Value'] = 0

    cursor = con.cursor()

    seq_query = "Select sequence_setup.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_index = cursor.fetchone()[0]

    query = "INSERT INTO setup VALUES (:setup_id, :position, :breathing, :zero_location,:orientation," \
            ":dose_notification_value,:dose_alert_value,:instructions,:overview ,:topogram, :excel_reference," \
            ":protocol_id_protocol)"
    args = {'setup_id':id_index, 'position':setup['Patient_Position'], 'breathing':str(setup['Breathing_Technique']),
            'zero_location':setup['Zero_location'],'orientation':setup['Orientation'],
            'dose_notification_value':setup['Dose_Notification'],'dose_alert_value':setup['Dose_Alert_Value'],
            'instructions':setup['Instruction'],'overview': protocol['Overview']  ,'topogram':setup['Topogram'], 'excel_reference':0,
            'protocol_id_protocol':getProtocolid(con)}
    test = (0,setup['Patient_Position'],setup['Breathing_Technique'],setup['Zero_location'],setup['Orientation'],
            setup['Dose_Notification'],setup['Dose_Alert_Value'],setup['Instruction'],setup['Topogram'],0,
            getProtocolid(con))

    print query
    print test
    print args
    cursor.execute(query, args)
    con.commit()
    cursor.close()
    tablename = "setup"
    display_records(con, tablename)



def display_records(con, tablename):
    cursor = con.cursor()
    query = "SELECT * FROM {table_nme} ".format(table_nme= tablename)
    cursor.execute(query)
    rows = cursor.fetchall()
    print tablename
    print('Total Row(s):', cursor.rowcount)

    for row in rows:
        print(row)