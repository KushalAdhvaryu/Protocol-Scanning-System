from openpyxl import load_workbook
import collections
import cx_Oracle

labels = collections.OrderedDict()

labels_dict = {'Protocol name':[],'Range name': [],'Series description': [], 'Ref. kV': [], 'kV': [],
               'Quality ref. mAs': [], '(Eff.) mAs': [],'(Eff.) mAs(Tube A)': [],'(Eff.) mAs(Tube B)': [],
               'CARE kV': [], 'Tissue of Interest (Slider position 1 - 12)': [], 'Dose modulation': [],
               'CARE Dose type': [], 'CTDIvol (mGy)': [], 'FAST Adjust: Upper limit scan time': [],
               'FAST Adjust: Lower limit max. mAs': [], 'Dose Notification value CTDIvol (mGy)': [],
               'Dose Notification value DLP (mGy*cm)': [], 'Rotation time (s)': [], 'Scan time (s)': [],
               'Delay (s)': [], 'Pitch': [],'Feed per scan (mm)': [], 'Slice (mm)': [], 'Acq.': [],
               'Effective Slice (mm)': [], 'Position increment (mm)': [], 'No. of images': [], 'Kernel/Algorithm': [],
               'Window': [], 'API': [], 'Comment 1': [], 'Comment 2': [], 'Auto transfer 1': [], 'Auto transfer 2': [],
               'Auto transfer 3': [], 'syngo.via: Workflow': [], 'syngo.via: Data role': [], 'Scan start': [],
               'Scan end': [], 'Pulsing': [], 'Pulsing start': [], 'Pulsing end': [], 'Best phase': [],
               'Phase start': [], 'Multi phase': []
               }
labels_list = ['Protocol name','Range name','Series description', 'Ref. kV', 'kV', 'Quality ref. mAs',
          '(Eff.) mAs','(Eff.) mAs(Tube A)','(Eff.) mAs(Tube B)', 'CARE kV',
          'Tissue of Interest (Slider position 1 - 12)', 'Dose modulation', 'CARE Dose type',
          'CTDIvol (mGy)', 'FAST Adjust: Upper limit scan time', 'FAST Adjust: Lower limit max. mAs',
          'Dose Notification value CTDIvol (mGy)', 'Dose Notification value DLP (mGy*cm)',
          'Rotation time (s)', 'Scan time (s)', 'Delay (s)', 'Pitch', 'Feed per scan (mm)',
          'Slice (mm)', 'Acq.', 'Effective Slice (mm)', 'Position increment (mm)',
          'No. of images', 'Kernel/Algorithm', 'Window', 'API', 'Comment 1', 'Comment 2',
          'Auto transfer 1', 'Auto transfer 2', 'Auto transfer 3', 'syngo.via: Workflow',
          'syngo.via: Data role', 'Scan start', 'Scan end', 'Pulsing', 'Pulsing start',
          'Pulsing end', 'Best phase', 'Phase start', 'Multi phase'
          ]

new_protocol_at = []
new_protocol_set = {}

protocol = {'Protocol_Name': ''}

setup = {'breathing': [], 'dose_notification_value': []}

scout = {'scan_type': [], 'scout_kV': [], 'mA': [], 'scout_start': [], 'scout_end': [], 'scout_ww_wl': [],
         'scout_kernel': [], 'scout_destinations': []}

scan = {'scan_kV': [], 'rotation_time': [], 'scan_length': [], 'scan_delay': [], 'scan_thickness': [],
        'scan_interval': [], 'detector_coverage': [], 'pitch': [], 'CARE_dose4d': [], 'CARE_kV': [],
        'dose_optimized_level': [], 'ref_qrm': [],'ref_kv': [], 'CTDIvol(mGY)':[]}

recon = {'description': [], 'recon_thickness': [], 'recon_interval': [], 'recon_ww_wl': [], 'recon_kernel': [],
                     'recon_destination': []}




def parse_excel(file_name, sheet_name):
    wb = load_workbook(filename=file_name, read_only=True)
    ws = wb[sheet_name]
    pass_row = int(ws.calculate_dimension().split("T")[-1])
    # print(ws.calculate_dimension())
    isFirstline  = True
    row_count = 1
    buffer_row = []
    for row in ws.rows:
        # print row_count
        for cell in row:
            if isFirstline:
                pass
            else:
                buffer_row.append(cell.value)
        # print buffer_row
        # print len(buffer_row)
        index = 0
        for word in labels_list:
            if isFirstline:
                break
            else:
                labels_dict[word].append(buffer_row[index])
                if buffer_row[1] == buffer_row[2] == buffer_row[3] == buffer_row[4] == buffer_row[5]:
                    new_protocol_at.append(row_count)
            index += 1
        # print index
        row_count += 1
        isFirstline = False
        buffer_row[:] = []
    return pass_row



def display_excelinfo(pass_row):

    print ("-------------------------- New Protocol At Row Numbers--------------------------------")
    print set(new_protocol_at)
    print(
    "----------------------------------Excel File-----------------------------------------------------------")
    for word in labels_list:
        print word,
        # print(len(labels_dict[word]))
    print
    for i in xrange(pass_row - 1):
        print "Row  " + str(i)
        for word in labels_list:
            print labels_dict[word][i],
        print

def extract_protocolrange(pass_row):
    new_protocol_set = sorted(set(new_protocol_at))
    print new_protocol_set
    for i in range(len(new_protocol_set)):
        start = new_protocol_set[i] - 2
        if i == len(new_protocol_set) -1:
            end = pass_row-2
        else:
            end  = new_protocol_set[i+1] - 3

        print start
        print end
        extract_protocolinfo(start, end)
        a = raw_input("Press Enter to Continue .....")

def display_records(con, tablename):
    cursor = con.cursor()
    query = "SELECT * FROM {table_nme} ".format(table_nme= tablename)
    cursor.execute(query)
    rows = cursor.fetchall()
    print tablename
    print('Total Row(s):', cursor.rowcount)

    for row in rows:
        print(row)

def insert_protocol(source):
    cursor = con.cursor()

    seq_query = "Select sequence_protocol.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_index = cursor.fetchone()[0]

    query = "INSERT INTO protocol VALUES(:protocol_id,:protocol_name,:protocol_source)"
    args = {'protocol_id': id_index, 'protocol_name': protocol['Protocol_Name'], 'protocol_source': source}
    cursor.execute(query, args)
    con.commit()
    cursor.close()

    tablename = "protocol"
    display_records(con, tablename)
    print("Record inserted in protocol table.")

def getProtocolid():
    cursor = con.cursor()
    query = "SELECT protocol_id FROM ( SELECT protocol_id FROM protocol ORDER BY protocol_id DESC) WHERE ROWNUM = 1"
    cursor.execute(query)
    id  = cursor.fetchone()[0]
    print id
    cursor.close()
    return id

def insert_radiograph():
    display_parsedinfo()
    cursor = con.cursor()

    #Get excel reference id for access of this record across different tables.
    seq_query = "Select sequence_local_radiograph.NEXTVAL From dual"
    cursor.execute(seq_query)
    excel_reference = cursor.fetchone()[0]
    protocol_id = getProtocolid()
    # Insert into Recon Table.
    seq_query = "Select sequence_recon.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_recon = cursor.fetchone()[0]

    query_recon = "INSERT INTO recon  VALUES (:recon_id, :description, :dfov, :a_p_center, :r_l_center, :thickness, " \
            ":recon_interval, :recon_algorithm, :ww_wl, :safire, :safire_strength, :recon_fast, :recon_kernel, " \
            ":recon_slice_data, :recon_type, :recon_region, :recon_axis, :threed_type, :image_order, :asir, " \
            ":destinations, :increments,:fov, :slice, :window,:noise_supression,:excel_reference, " \
            ":protocol_id_protocol)"
    args_recon = {'recon_id': id_recon, 'description': recon['description'][0], 'dfov': 0, 'a_p_center': "None",
            'r_l_center': "None",'thickness': 0, 'recon_interval': 0,'recon_algorithm': "None", 'ww_wl': "None",
            'safire': "None",'safire_strength': "None", 'recon_fast': "None",'recon_kernel': "None",
            'recon_slice_data': "None",'recon_type': "None", 'recon_region': "None",'recon_axis': "None",
            'threed_type': "None", 'image_order': "None", 'asir': "None", 'destinations': "None", 'increments': 0,
            'fov': 0, 'slice': 0,'window': "None", 'noise_supression': "None",'excel_reference': excel_reference,
            'protocol_id_protocol': protocol_id}
    print query_recon
    print args_recon
    cursor.execute(query_recon, args_recon)
    con.commit()

    #Insert into Setup.
    if setup['breathing'] == None or setup['breathing'] == '':
        setup['breathing'].append( "None")
    seq_query = "Select sequence_setup.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_setup = cursor.fetchone()[0]

    query_setup = "INSERT INTO setup VALUES (:setup_id, :position, :breathing, :zero_location,:orientation," \
            ":dose_notification_value,:dose_alert_value,:instructions,:overview ,:topogram, :excel_reference," \
            ":protocol_id_protocol)"
    args_setup = {'setup_id': id_setup, 'position': "None", 'breathing': str(setup['breathing'][0]),
            'zero_location': "None", 'orientation': "None",
            'dose_notification_value': 0, 'dose_alert_value': 0,
            'instructions': "None", 'overview': "None",'topogram': "None", 'excel_reference': excel_reference,
            'protocol_id_protocol': protocol_id}
    # print query_setup
    # print args_setup
    cursor.execute(query_setup, args_setup)
    con.commit()

    #Insert into Scout
    scout_notnull = ['scout_start','scout_end']
    for word in scout_notnull:
        if scout[word] == []:
            scout[word].append("None")

    seq_query = "Select sequence_scout.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_scout = cursor.fetchone()[0]

    query_scout = "INSERT INTO scout  VALUES(:scout_id,:scan_type, :scout_kv, :scout_mA, :scout_direction, :scout_start, " \
            ":scout_end, :scout_plane, :scout_ww_wl, :scout_kernel, :scout_destination,:scout_length," \
            ":excel_reference,:protocol_id_protocol)"
    args_scout = {'scout_id': id_scout, 'scan_type': scout['scan_type'][0], 'scout_kv': int(scout['scout_kV'][0]),
            'scout_mA': int(scout['mA'][0]), 'scout_direction':"None" , 'scout_start': scout['scout_start'][0],
            'scout_end': scout['scout_start'][0], 'scout_plane': "None", 'scout_ww_wl': scout['scout_ww_wl'][0],
            'scout_kernel': scout['scout_kernel'][0], 'scout_destination': scout['scout_destinations'][0],
            'scout_length':"None",'excel_reference': excel_reference, 'protocol_id_protocol': protocol_id }
    # print query_scout
    # print args_scout
    cursor.execute(query_scout, args_scout)
    con.commit()
    cursor.close()

def insert_rotational_scan():
    display_parsedinfo()
    cursor = con.cursor()

    # Get excel reference id for access of this record across different tables.
    seq_query = "Select sequence_rotational_scan.NEXTVAL From dual"
    cursor.execute(seq_query)
    excel_reference = cursor.fetchone()[0]
    protocol_id = getProtocolid()

    # Insert into Recon Table.
    seq_query = "Select sequence_recon.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_recon = cursor.fetchone()[0]

    query_recon = "INSERT INTO recon  VALUES (:recon_id, :description, :dfov, :a_p_center, :r_l_center, :thickness, " \
                  ":recon_interval, :recon_algorithm, :ww_wl, :safire, :safire_strength, :recon_fast, :recon_kernel, " \
                  ":recon_slice_data, :recon_type, :recon_region, :recon_axis, :threed_type, :image_order, :asir, " \
                  ":destinations, :increments,:fov, :slice, :window,:noise_supression,:excel_reference, " \
                  ":protocol_id_protocol)"
    args_recon = {'recon_id': id_recon, 'description': recon['description'][0], 'dfov': 0, 'a_p_center': "None",
                  'r_l_center': "None", 'thickness': 0, 'recon_interval': 0, 'recon_algorithm': "None", 'ww_wl': "None",
                  'safire': "None", 'safire_strength': "None", 'recon_fast': "None", 'recon_kernel': "None",
                  'recon_slice_data': "None", 'recon_type': "None", 'recon_region': "None", 'recon_axis': "None",
                  'threed_type': "None", 'image_order': "None", 'asir': "None", 'destinations': "None", 'increments': 0,
                  'fov': 0, 'slice': 0, 'window': "None", 'noise_supression': "None",
                  'excel_reference': excel_reference,
                  'protocol_id_protocol': protocol_id}
    # print query_recon
    # print args_recon
    cursor.execute(query_recon, args_recon)
    con.commit()

    # Insert into Setup.
    if setup['breathing'] == None or setup['breathing'] == '':
        setup['breathing'].append("None")
    if setup['dose_notification_value'] == None or setup['dose_notification_value'] == '':
        setup['dose_notification_value'].append(0)
    seq_query = "Select sequence_setup.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_setup = cursor.fetchone()[0]

    query_setup = "INSERT INTO setup VALUES (:setup_id, :position, :breathing, :zero_location,:orientation," \
                  ":dose_notification_value,:dose_alert_value,:instructions,:overview, :topogram, :excel_reference," \
                  ":protocol_id_protocol)"
    args_setup = {'setup_id': id_setup, 'position': "None", 'breathing': str(setup['breathing'][0]),
                  'zero_location': "None", 'orientation': "None",
                  'dose_notification_value': setup['dose_notification_value'][0], 'dose_alert_value': 0,
                  'instructions': "None",'overview': "None" , 'topogram': "None", 'excel_reference': excel_reference,
                  'protocol_id_protocol': protocol_id}
    # print query_setup
    # print args_setup
    cursor.execute(query_setup, args_setup)
    con.commit()

    #Insert into Scan
    scan_notnull = ['scan_length','scan_interval','ref_kv']
    for word in scan_notnull:
        if scan[word] == []:
            scan[word].append(0)
    if scan['CARE_kV'] == []:
            scan['CARE_kV'].append("None")

    seq_query = "Select sequence_protocol_scan.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_scan = cursor.fetchone()[0]
    query_scan = "INSERT INTO protocol_scan  VALUES(:scan_id, :scan_type, :scan_kv, :scan_ma, :rotation_time, " \
            ":scan_coverage, :scan_delay, :scan_direction, :scan_thickness, :scan_interval,:rotation_length," \
            ":detector_coverage, :pitch, :speed, :tilt, :sfov, :care_dose4d, :care_kv, :dose_optimized_level," \
            ":dual_energy, :hi_res, :cardiac, :number_of_scans, :feed, :ref_qrm, :ref_kv,:scan_description," \
            ":ctdivol,:excel_reference ,:protocol_id_protocol)"
    args_scan = {'scan_id': id_scan, 'scan_type': "None", 'scan_kv': scan['scan_kV'][0], 'scan_ma': 0,
            'rotation_time': float(scan['rotation_time'][0]),
            'scan_coverage': scan['scan_length'][0], 'scan_delay': scan['scan_delay'][0],
            'scan_direction': "None", 'scan_thickness': scan['scan_thickness'][0],
            'scan_interval': scan['scan_interval'][0], 'rotation_length': "None",
            'detector_coverage': scan['detector_coverage'][0], 'pitch': float(scan['pitch'][0]),
            'speed': 0, 'tilt': 0, 'sfov': "None",
            'care_dose4d': scan['CARE_dose4d'][0], 'care_kv': str(scan['CARE_kV'][0]),
            'dose_optimized_level': int(scan['dose_optimized_level'][0]), 'dual_energy': "None",
            'hi_res': "None", 'cardiac': "None", 'number_of_scans': 0,
            'feed': 0, 'ref_qrm': int(scan['ref_qrm'][0]), 'ref_kv': str(scan['ref_kv'][0]),
            'scan_description': "None",'ctdivol':str(scan['CTDIvol(mGY)'][0]), 'excel_reference': excel_reference,
            'protocol_id_protocol': protocol_id}

    print query_scan
    print args_scan
    cursor.execute(query_scan, args_scan)
    con.commit()
    cursor.close()

def insert_reconstruction():
    display_parsedinfo()
    cursor = con.cursor()

    # Get excel reference id for access of this record across different tables.
    seq_query = "Select sequence_rotational_scan.NEXTVAL From dual"
    cursor.execute(seq_query)
    excel_reference = cursor.fetchone()[0]
    protocol_id = getProtocolid()

    # Insert into Recon Table.
    seq_query = "Select sequence_recon.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_recon = cursor.fetchone()[0]

    query_recon = "INSERT INTO recon  VALUES (:recon_id, :description, :dfov, :a_p_center, :r_l_center, :thickness, " \
                  ":recon_interval, :recon_algorithm, :ww_wl, :safire, :safire_strength, :recon_fast, :recon_kernel, " \
                  ":recon_slice_data, :recon_type, :recon_region, :recon_axis, :threed_type, :image_order, :asir, " \
                  ":destinations, :increments,:fov, :slice, :window,:noise_supression,:excel_reference, " \
                  ":protocol_id_protocol)"
    args_recon = {'recon_id': id_recon, 'description': "None", 'dfov': 0, 'a_p_center': "None",
                  'r_l_center': "None", 'thickness': recon['recon_thickness'][0],
                  'recon_interval': recon['recon_interval'][0], 'recon_algorithm': "None",
                  'ww_wl': recon['recon_ww_wl'][0], 'safire': "None", 'safire_strength': "None", 'recon_fast': "None",
                  'recon_kernel': recon['recon_kernel'][0], 'recon_slice_data': "None", 'recon_type': "None",
                  'recon_region': "None", 'recon_axis': "None",'threed_type': "None", 'image_order': "None",
                  'asir': "None", 'destinations': recon['recon_destination'][0], 'increments': 0,
                  'fov': 0, 'slice': 0, 'window': "None", 'noise_supression': "None",
                  'excel_reference': excel_reference, 'protocol_id_protocol': protocol_id}

    print query_recon
    print args_recon
    cursor.execute(query_recon, args_recon)
    con.commit()

    # Insert into Scout
    scout_notnull = ['scout_start', 'scout_end']
    for word in scout_notnull:
        if scout[word] == []:
            scout[word].append("None")

    seq_query = "Select sequence_scout.NEXTVAL From dual"
    cursor.execute(seq_query)
    id_scout = cursor.fetchone()[0]

    query_scout = "INSERT INTO scout  VALUES(:scout_id,:scan_type, :scout_kv, :scout_mA, :scout_direction, " \
                  ":scout_start, :scout_end, :scout_plane, :scout_ww_wl, :scout_kernel, :scout_destination," \
                  ":scout_length,:excel_reference, :protocol_id_protocol)"
    args_scout = {'scout_id': id_scout, 'scan_type': scout['scan_type'][0], 'scout_kv': 0,
                  'scout_mA': 0, 'scout_direction': "None", 'scout_start': "None",
                  'scout_end': "None", 'scout_plane': "None", 'scout_ww_wl': "None",
                  'scout_kernel': "None", 'scout_destination': "None",'scout_length':"None",
                  'excel_reference': excel_reference, 'protocol_id_protocol': protocol_id}
    print query_scout
    print args_scout
    cursor.execute(query_scout, args_scout)
    con.commit()
    cursor.close()


def clear_data():
    print ("-------------------------- Clear Setup --------------------------------")
    for word in setup:
        setup[word] = []
    print ("-------------------------- Clear Scout --------------------------------")
    for word in scout:
        scout[word] = []
    print ("-------------------------- Clear Scan --------------------------------")
    for word in scan:
        scan[word] = []
    print ("-------------------------- Clear Recon --------------------------------")
    for word in recon:
        recon[word] = []


def extract_protocolinfo(start, end):
    print start, end
    for i in xrange(start,end+1):
        if i == start:
            protocol['Protocol_Name'] = labels_dict['Protocol name'][i]
            insert_protocol(source= "excel")
        elif 'topogram' in str(labels_dict['Series description'][i]).lower() and labels_dict['Ref. kV'][i] == None:
            print "Topogram Record " + str(i)
            labels_topogram = ['Range name', 'Series description', 'kV','(Eff.) mAs',
                           'Tissue of Interest (Slider position 1 - 12)', 'Dose modulation',
                           'CTDIvol (mGy)','Rotation time (s)',  'Delay (s)', 'Pitch','Acq.', 'Effective Slice (mm)',
                           'Kernel/Algorithm', 'Window', 'API', 'Auto transfer 1', 'Auto transfer 2', 'Auto transfer 3'
                           ]
            mapping_topogram = ['description','scan_type','scout_kV','mA', 'dose_optimized_level','CARE_dose4d',
                                'CTDIvol(mGY)', 'rotation_time', 'scan_delay', 'pitch', 'detector_coverage', 'scan_thickness',
                               'scout_kernel', 'scout_ww_wl','breathing', 'scout_destinations','scout_destinations',
                                'scout_destinations']
            k = 0
            print "entering labels topogram"
            scout_destt_merge = " "
            for word in labels_topogram:
                # print word
                # print mapping_topogram[k]
                if mapping_topogram[k] in recon:
                    recon[mapping_topogram[k]].append(labels_dict[word][i])
                elif mapping_topogram[k] in scout:
                    if 'Auto' in word:
                        scout_destt_merge  += str(labels_dict[word][i]) + " "
                        if '3' in word:
                            scout[mapping_topogram[k]].append(scout_destt_merge)
                            scout_destt_merge = " "
                    else:
                        scout[mapping_topogram[k]].append(labels_dict[word][i])
                elif mapping_topogram[k] in scan:
                    scan[mapping_topogram[k]].append(labels_dict[word][i])
                elif mapping_topogram[k] in setup:
                    setup[mapping_topogram[k]].append(labels_dict[word][i])
                k +=1
            insert_radiograph()
            clear_data()

        elif labels_dict['Range name'][i] != None and labels_dict['Series description'][i] == None and \
                        labels_dict['Ref. kV'] != None:
            print "Scan Record " + str(i)
            labels_scan = [ 'Range name',  'Ref. kV', 'kV', 'Quality ref. mAs', '(Eff.) mAs',  'CARE kV',
                           'Tissue of Interest (Slider position 1 - 12)', 'Dose modulation', 'CARE Dose type',
                           'CTDIvol (mGy)','Dose Notification value CTDIvol (mGy)','Rotation time (s)',  'Delay (s)',
                            'Pitch', 'Slice (mm)', 'Acq.',  'API'
                           ]
            mapping_scan = ['description','ref_kv','scan_kV', 'ref_qrm','mA', 'CARE_kV', 'dose_optimized_level', 'CARE_dose4d',
                            'CARE_dose4d', 'CTDIvol(mGY)', 'dose_notification_value', 'rotation_time', 'scan_delay',
                            'pitch', 'scan_thickness', 'detector_coverage', 'breathing']
            k = 0
            print "entering labels topogram"
            dose_mod_merge = " "
            for word in labels_scan:
                # print word
                # print mapping_scan[k]
                if mapping_scan[k] in recon:
                    recon[mapping_scan[k]].append(labels_dict[word][i])
                elif mapping_scan[k] in scout:
                    scout[mapping_scan[k]].append(labels_dict[word][i])
                elif mapping_scan[k] in scan:
                    if 'Dose modulation' in word:
                        dose_mod_merge += labels_dict[word][i] + " "
                    elif 'CARE Dose type' == word:
                        dose_mod_merge += labels_dict[word][i]
                        scan[mapping_scan[k]].append(dose_mod_merge)
                        dose_mod_merge = " "
                    else:
                        scan[mapping_scan[k]].append(labels_dict[word][i])
                elif mapping_scan[k] in setup:
                    setup[mapping_scan[k]].append(labels_dict[word][i])
                k += 1
            insert_rotational_scan()
            clear_data()
            #to process combination of Dose modulation and CARE Dose TYpe for CASE_Does4d.
        else:
            print "Radiation Record " + str(i)

            labels_radiations = ['Series description', 'Effective Slice (mm)', 'Position increment (mm)',
                            'Kernel/Algorithm', 'Window', 'Auto transfer 1', 'Auto transfer 2', 'Auto transfer 3'
                           ]
            mapping_radiations = ['scan_type','recon_thickness','recon_interval','recon_kernel','recon_ww_wl',
                                 'recon_destination', 'recon_destination','recon_destination']
            k = 0
            print "entering labels topogram"
            recon_destt_merge = " "
            for word in labels_radiations:
                # print word
                # print mapping_scan[k]
                if mapping_radiations[k] in recon:
                    if 'Auto' in word:
                        recon_destt_merge += str(labels_dict[word][i]) + " "
                        if '3' in word:
                            recon[mapping_radiations[k]].append(recon_destt_merge)
                            recon_destt_merge = " "
                    else:
                        recon[mapping_radiations[k]].append(labels_dict[word][i])
                elif mapping_radiations[k] in scout:
                    scout[mapping_radiations[k]].append(labels_dict[word][i])
                elif mapping_radiations[k] in scan:
                    scan[mapping_radiations[k]].append(labels_dict[word][i])
                elif mapping_radiations[k] in setup:
                    setup[mapping_radiations[k]].append(labels_dict[word][i])
                k += 1
            insert_reconstruction()
            clear_data()



        # print "Row  " + str(i)
        # for word in labels_list:
        #     print labels_dict[word][i],
        # print
    # display_parsedinfo()

def display_parsedinfo():
    print ("-------------------------- Protocol --------------------------------")
    for word in protocol:
        print word
        print protocol[word]
    print ("-------------------------- Setup --------------------------------")
    for word in setup:
        print word
        print setup[word]
    print ("-------------------------- Scout --------------------------------")
    for word in scout:
        print word
        print scout[word]
    print ("-------------------------- Scan --------------------------------")
    for word in scan:
        print word
        print scan[word]
    print ("-------------------------- Recon --------------------------------")
    for word in recon:
        print word
        print recon[word]

def getopenconnection():
    """ Connect to MySQL database 
    return mysql.connector.connect(host='127.0.0.1',
                                       database='protocol',
                                       user='root',
                                       password='1234')
    """
    return cx_Oracle.connect("ANONYMOUS", "mayo", "mayo")





if __name__ == "__main__":
    try:
        print("Getting connection to database")
        con = getopenconnection()
        print ('Connected to Oracle database Version '+con.version)

        pass_row = parse_excel("test_excel.xlsx", 'Sheet1')
        print pass_row
        display_excelinfo(pass_row)
        extract_protocolrange(pass_row)


    except Exception as detail:
        print ("Something bad has happened!!! This is the error ==> ", detail)

    finally:
        if con:
            con.close()

