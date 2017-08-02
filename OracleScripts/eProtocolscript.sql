--------------------- Protocol Table
-- DROP Table Protocol 
DROP TABLE protocol;
DROP sequence sequence_protocol;

-- Protocol Create Sequence
Create sequence sequence_protocol start with 3
  increment by 1
  minvalue 1;
  
-- Create Table Protocol
CREATE TABLE protocol
    (
      protocol_id  NUMBER(3) CONSTRAINT pro_pid_pk PRIMARY KEY ,
      protocol_name VARCHAR2(75char),
      protocol_source varchar2(25char)
    );

-- INSERT into Table Protocol
INSERT INTO protocol (protocol_id, protocol_name, protocol_source) 
VALUES 
(sequence_protocol.NEXTVAL, 'First protocol', 'Word');

INSERT INTO protocol (protocol_id, protocol_name, protocol_source) 
VALUES 
(sequence_protocol.NEXTVAL, 'Second protocol', 'Word');
 
--- DELETE ROW from PROTOCOL table
-- DELETE FROM protocol WHERE protocol_id = 2;
Select sequence_protocol.NEXTVAL From dual;

--------------------- Billing Table
-- DROP Table and Sequence Billing 
DROP TABLE billing;
DROP sequence sequence_billing;

-- Protocol Create Billing
Create sequence sequence_billing start with 1
  increment by 1
  minvalue 1;

-- Create Table Billing
CREATE TABLE billing
    (
      billing_id  NUMBER(3) CONSTRAINT bill_bid_pk PRIMARY KEY ,
      charge VARCHAR2(250char) NOT NULL,
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT bill_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  
  
-- INSERT into Table Billing
INSERT INTO billing (billing_id, charge, protocol_id_protocol) 
VALUES 
(sequence_billing.NEXTVAL, 'First Billing', 2);

INSERT INTO billing (billing_id, charge,protocol_id_protocol) 
VALUES 
(sequence_billing.NEXTVAL, 'Second Billing',2);

--------------------- Device Name Table
-- DROP Table and Sequence Billing 
DROP TABLE device_name;
DROP sequence sequence_device_name;

-- Create sequence Device Name
Create sequence sequence_device_name start with 1
  increment by 1
  minvalue 1;

-- Create Table Device Name
CREATE TABLE device_name
    (
      device_name_id  NUMBER(3) CONSTRAINT dev_did_pk PRIMARY KEY ,
      brand VARCHAR2(45char) NOT NULL,
      scanner VARCHAR2(45char) NOT NULL,
      device_number number(4) NOT NULL,
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT dev_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Device name
INSERT INTO device_name (device_name_id, brand, scanner, device_number,
                          protocol_id_protocol) 
VALUES 
(sequence_device_name.NEXTVAL, 'Brand', 'Scanner', 1, 2);

--------------------- Setup Table
-- DROP Table and Sequence setup 
DROP TABLE setup;
DROP sequence sequence_setup;

-- Create sequence setup
Create sequence sequence_setup start with 1
  increment by 1
  minvalue 1;

-- Create Table setup
CREATE TABLE setup
    (
      setup_id  NUMBER(3) CONSTRAINT set_sid_pk PRIMARY KEY ,
      position VARCHAR2(45char) NOT NULL,
      breathing VARCHAR2(45char)NOT NULL ,
      zero_location VARCHAR2(45char) NOT NULL ,
      orientation VARCHAR2(45char) NOT NULL ,
      dose_notification_value NUMBER(5,2) NOT NULL,
      does_alert_value NUMBER(5,2) ,
      instructions VARCHAR2(1000char) NOT NULL,
      overview VARCHAR2(1000char) DEFAULT ON NULL 'None',
      topogram VARCHAR2(45char) ,
      excel_reference NUMBER(4),
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT set_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into setup
INSERT INTO setup  
VALUES 
(sequence_setup.NEXTVAL, 'Position', 'Breathing', 'Zero location', 'Orientation',
 1,3,'Instructions','Topogram',1, 2);
 
--------------------- Medication Table
-- DROP Table and Sequence setup 
DROP TABLE medication;
DROP sequence sequence_medication;

-- Create sequence Medication
Create sequence sequence_medication start with 1
  increment by 1
  minvalue 1;

-- Create Table Medication
CREATE TABLE medication
    (
      medication_id  NUMBER(3) CONSTRAINT med_mid_pk PRIMARY KEY ,
      oral_contrast VARCHAR2(75char) ,
      oral_contrast_notes VARCHAR2(250char) ,
      iv_contrast VARCHAR2(75char) ,
      iv_contrast_notes VARCHAR2(250char) ,
      injection_rate VARCHAR2(75char) ,
      injection_rate_notes VARCHAR2(250char) ,
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT med_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Medication
INSERT INTO medication  
VALUES 
(sequence_medication.NEXTVAL, 'Oral contrast', 'Oral Contrast Notes', 
 'IV Contrast', 'IV Contrast Notes','Injection Rate','Injection Rates Note', 2);
 
--------------------- Scout Table
-- DROP Table and Sequence Scout
DROP TABLE scout;
DROP sequence sequence_scout;

-- Create sequence Scout
Create sequence sequence_scout start with 1
  increment by 1
  minvalue 1;

-- Create Table Scout
CREATE TABLE scout
    (
      scout_id  NUMBER(3) CONSTRAINT sco_scid_pk PRIMARY KEY ,
      scan_type VARCHAR2(45char) NOT NULL,
      scout_kv NUMBER(5,2) NOT NULL,
      scout_ma NUMBER(5,2) NOT NULL,
      scout_direction VARCHAR2(45char) ,
      scout_start  VARCHAR2(45char) NOT NULL,
      scout_end  VARCHAR2(45char) NOT NULL,
      scout_plane  VARCHAR2(45char)NOT NULL,
      scout_ww_wl  VARCHAR2(45char),
      scout_kernel  VARCHAR2(45char),
      scout_destination  VARCHAR2(45char) NOT NULL,
      excel_reference NUMBER(4),
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT sco_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Scout
INSERT INTO scout  
VALUES 
(sequence_scout.NEXTVAL, 'Type', 1.2,2.3, 'Direction', 'Start', 'End', 'Plane', 
 'Window', 'Kernel','Destination', 1, 2);
 

 
--------------------- Scan Table
-- DROP Table and Sequence Scan
DROP TABLE protocol_scan;
DROP sequence sequence_protocol_scan;

-- Create sequence Scan
Create sequence sequence_protocol_scan start with 1
  increment by 1
  minvalue 1;

-- Create Table Scan
CREATE TABLE protocol_scan
    (
      scan_id  NUMBER(4) CONSTRAINT scn_snid_pk PRIMARY KEY ,
      scan_type VARCHAR2(45char) NOT NULL,
      scan_kv NUMBER(5,2) NOT NULL,
      scan_ma NUMBER(5,2) NOT NULL,
      rotation_time NUMBER(5,2) NOT NULL,
      scan_coverage NUMBER(5,2)  NOT NULL,
      scan_delay  NUMBER(5,2) NOT NULL,
      scan_direction  VARCHAR2(45char),
      scan_thickness  NUMBER(5,2)  NOT NULL,
      scan_interval  NUMBER(5,2)  NOT NULL,
      rotation_length  VARCHAR2(45char) ,
      detector_coverage VARCHAR2(45char),
      pitch NUMBER(5,2)  NOT NULL,
      speed NUMBER(5,2)  NOT NULL,
      tilt NUMBER(5,2),
      sfov VARCHAR2(45char)  NOT NULL,
      care_dose4d VARCHAR2(45char)  NOT NULL,
      care_kv VARCHAR2(45char)  NOT NULL,
      dose_optimized_level NUMBER(5,2)  NOT NULL,
      dual_energy VARCHAR2(45char),
      hi_res VARCHAR2(45char),
      cardiac VARCHAR2(45char),
      number_of_scans NUMBER(5,2),
      feed NUMBER(5,2),
      ref_qrm NUMBER(5,2),
      ref_kv NUMBER(5,2),
      scan_description VARCHAR2(250char)  NOT NULL,
      ctdivol VARCHAR2(45char),
      excel_reference NUMBER(4),
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT scn_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
      
    );  

-- INSERT Into Scan
INSERT INTO protocol_scan  
VALUES 
(sequence_protocol_scan.NEXTVAL, 'Type', 1.2,2.3, 3.4,4.5,5.6, 'Direction',6.7,
7.8,'Rotation Length',8.9,9.1,10.11,11.12,'SFOV','CARE DOSE4D','CARE KV',12.13,
'Dual Energy','Hi Res', 'Cardiac', 13.14,14.15,15.16,16.17,'description','ctdivol',1,2);

INSERT INTO protocol_scan  
VALUES 
(2, 'None', 0, 0, 0.5, 0, 0, 'Craniocaudal', 0, 0, 'None', 0, 1.0, 0, 0, 'None'
, 'On', 'On', 7, 'None', 'None', 'None', 0, 0, 200, 150, 'None','ctdivol', 0, 17);

--------------------- Recon Table
-- DROP Table and Sequence Recon
DROP TABLE recon;
DROP sequence sequence_recon;

-- Create sequence Recon
Create sequence sequence_recon start with 1
  increment by 1
  minvalue 1;

-- Create Table Recon
CREATE TABLE recon
    (
      recon_id  NUMBER(4) CONSTRAINT rec_rid_pk PRIMARY KEY ,
      description VARCHAR2(45char) NOT NULL,
      dfov NUMBER(5,2) ,
      a_p_center VARCHAR2(45char) ,
      r_l_center VARCHAR2(45char) ,
      thickness NUMBER(5,2)  ,
      recon_interval NUMBER(5,2) ,
      recon_algorithm  VARCHAR2(45char)NOT NULL,
      ww_wl  VARCHAR2(45char)  NOT NULL,
      safire  VARCHAR2(45char)  ,
      safire_strength  VARCHAR2(45char) ,
      recon_fast VARCHAR2(45char),
      recon_kernel VARCHAR2(45char)  ,
      recon_slice_data VARCHAR2(45char)  ,
      recon_type VARCHAR2(45char) NOT NULL,
      recon_region VARCHAR2(45char)  NOT NULL,
      recon_axis VARCHAR2(45char)  NOT NULL,
      threed_type VARCHAR2(45char)  NOT NULL,
      image_order VARCHAR2(45char)  NOT NULL,
      asir VARCHAR2(45char),
      destinations VARCHAR2(45char)NOT NULL,
      increments NUMBER(5,2)NOT NULL,
      fov NUMBER(5,2)NOT NULL,
      slice NUMBER(5,2)NOT NULL,
      window VARCHAR2(45char),
      noise_supression VARCHAR2(45char),
      excel_reference NUMBER(4),
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT rec_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Recon
INSERT INTO recon  
VALUES 
(sequence_recon.NEXTVAL, 'Description', 1.2,'ap center','RL Center',2.3,
123 ,'Algorithm','WW WL','SAFIRE', 'SAFIRE Strength', 'FAST', 'Kernel',
'Slice Data', 'Type', 'Region', 'Axis','Type','Image order','ASIR','Destination',
3.4,4.5,5.6, 'Window','Noise suppression',1,2);

INSERT INTO recon  
VALUES 
(3, 'art Che\n(axial)', 0, 'None', 'None', 0, 0, 'I41f medium', 'None', 1, 
'2', 1, 'None', 'None', 'Axial', 'Wide', 'None', 'N/A', 'None', 'None', 
'PACS', 2.0, '360', 3.0, '350 / 40', 'None', 0, 17);
--------------------- Rotuine Table
-- DROP Table and Sequence Rotuine 
DROP TABLE routine;
DROP sequence sequence_routine;

-- Create sequence Rotuine
Create sequence sequence_routine start with 1
  increment by 1
  minvalue 1;

-- Create Table Rotuine
CREATE TABLE routine
    (
      routine_id  NUMBER(4) CONSTRAINT rou_roid_pk PRIMARY KEY ,
      eff_mas VARCHAR2(45char) ,
      kv VARCHAR2(45char) ,
      routine_delay NUMBER(4) ,
      slice VARCHAR2(45char) ,
      dose_notification_value NUMBER(5,2) ,
      x_care VARCHAR2(45char) ,
      range_4d VARCHAR2(45char),
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT rou_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Rotuine
INSERT INTO routine  
VALUES 
(sequence_routine.NEXTVAL, 'Eff Mas', 'kv', 1.2, 'Slice', 2.3, 'X care', 
'Range 4d', 2);

INSERT INTO routine  
VALUES 
(2,'Modulated', 'Modulated', 25, '3.0 mm\nAcq 128x0.6 mm', 50, 0, 'None', 17);
 
--------------------- Bolus Tracking Table
-- DROP Table and Sequence Bolus Tracking 
DROP TABLE bolus_tracking;
DROP sequence sequence_bolus_tracking;

-- Create sequence Bolus Tracking
Create sequence sequence_bolus_tracking start with 1
  increment by 1
  minvalue 1;

-- Create Table Bolus Tracking
CREATE TABLE bolus_tracking
    (
      bolus_tracking_id  NUMBER(4) CONSTRAINT bol_btid_pk PRIMARY KEY ,
      mas NUMBER(5,2) ,
      kv NUMBER(5,2) ,
      bolus_delay NUMBER(5,2) ,
      bolus_trigger NUMBER(5,2) ,
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT bol_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Bolus Tracking
INSERT INTO bolus_tracking  
VALUES 
(sequence_bolus_tracking.NEXTVAL, 1.2, 2.3, 3.4, 4.5, 2);

--------------------- Recon  tab Table
-- DROP Table and Sequence Recon tab
DROP TABLE recon_tab;
DROP sequence sequence_recon_tab;

-- Create sequence Recon
Create sequence sequence_recon_tab start with 1
  increment by 1
  minvalue 1;

-- Create Table Recon
CREATE TABLE recon_tab
    (
      recon_id  NUMBER(4) CONSTRAINT rect_rtid_pk PRIMARY KEY ,
      description VARCHAR2(45char) NOT NULL,
      dfov NUMBER(5,2) ,
      a_p_center VARCHAR2(45char) ,
      r_l_center VARCHAR2(45char) ,
      thickness NUMBER(5,2)  ,
      recon_interval NUMBER(5,2) ,
      recon_algorithm  VARCHAR2(45char)NOT NULL,
      ww_wl  VARCHAR2(45char)  NOT NULL,
      safire  VARCHAR2(45char)  ,
      safire_strength  VARCHAR2(45char) ,
      recon_fast VARCHAR2(45char),
      recon_kernel VARCHAR2(45char)  ,
      recon_slice_data VARCHAR2(45char)  ,
      recon_type VARCHAR2(45char) NOT NULL,
      recon_region VARCHAR2(45char)  NOT NULL,
      recon_axis VARCHAR2(45char)  NOT NULL,
      threed_type VARCHAR2(45char)  NOT NULL,
      image_order VARCHAR2(45char)  NOT NULL,
      asir VARCHAR2(45char),
      destinations VARCHAR2(45char)NOT NULL,
      increments NUMBER(5,2)NOT NULL,
      fov NUMBER(5,2)NOT NULL,
      slice NUMBER(5,2)NOT NULL,
      window VARCHAR2(45char),
      noise_supression VARCHAR2(45char),
      excel_reference NUMBER(4),
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT rect_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Recon tab
INSERT INTO recon_Tab  
VALUES 
(sequence_recon_tab.NEXTVAL, 'Description', 1.2,'ap center','RL Center',2.3,
123 ,'Algorithm','WW WL','SAFIRE', 'SAFIRE Strength', 'FAST', 'Kernel',
'Slice Data', 'Type', 'Region', 'Axis','Type','Image order','ASIR','Destination',
3.4,4.5,5.6, 'Window','Noise suppression',1,2);


--------------------- Media Table
-- DROP Table and Sequence Media 
DROP TABLE media;
DROP sequence sequence_media;

-- Create sequence Media
Create sequence sequence_media start with 1
  increment by 1
  minvalue 1;

-- Create Table Media
CREATE TABLE media
    (
      media_id  NUMBER(4) CONSTRAINT mda_matid_pk PRIMARY KEY ,
      pdf_name VARCHAR2(250char) ,
      pdf_version VARCHAR2(45char) ,
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT mda_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Media
INSERT INTO media  
VALUES 
(sequence_media.NEXTVAL, 'C:/abc/xyz.pdf', '1.2.3',2);

--------------------------- Reconstruction Sequence
Create sequence sequence_reconstruction start with 1
  increment by 1
  minvalue 1;
  
DROP sequence sequence_reconstruction;
  
---------------------------- Rotational Scan Sequence
Create sequence sequence_rotational_scan start with 1
  increment by 1
  minvalue 1;

DROP sequence sequence_rotational_scan;
  
---------------------------- Localized RadioGraph
Create sequence sequence_local_radiograph start with 1
  increment by 1
  minvalue 1;

DROP sequence sequence_local_radiogrph;
  