------------------- Log Table
DROP TABLE editlog;

Create sequence sequence_editlog start with 1
  increment by 1
  minvalue 1;

CREATE TABLE editlog(
      log_id  NUMBER CONSTRAINT log_lid_pk PRIMARY KEY ,
      log_date date,
      log_summary VARCHAR2(250 char) NOT NULL,
      protocol_name VARCHAR2(75char) NOT NULL,
      protocol_id NUMBER(3),
      dt_of_change TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
      dt_of_approval TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
      changed_by VARCHAR2(250 char) NOT NULL,
      approved_by  VARCHAR2(250 char),
      isapproved VARCHAR2(250 char) DEFAULT ON NULL 'None'
    );


INSERT INTO editlog
VALUES
(1, sysdate,'Summary','Protocol1',2, systimestamp, systimestamp,'Kushal', 'Adhvaryu','No'); 
INSERT INTO editlog
VALUES
(2, sysdate,'Summary','Protocol1',2, '08-AUG-17 03.36.41.318000000 PM', '08-AUG-17 03.36.41.318000000 PM','Kushal', 'Adhvaryu','No'); 
INSERT INTO editlog
VALUES
(3, sysdate,'Summary','Protocol1',2, '09-AUG-17 03.36.41.318000000 PM', '09-AUG-17 03.36.41.318000000 PM','Kushal', 'Adhvaryu','No'); 
INSERT INTO editlog
VALUES
(4, sysdate,'Summary','Protocol1',2, '10-AUG-17 03.36.41.318000000 PM', '10-AUG-17 03.36.41.318000000 PM','Kushal', 'Adhvaryu','No'); 
INSERT INTO editlog
VALUES
(5, sysdate,'Summary','Protocol1',2, '11-AUG-17 03.36.41.318000000 PM', '11-AUG-17 03.36.41.318000000 PM','Kushal', 'Adhvaryu','No'); 
INSERT INTO editlog
VALUES
(6, sysdate, 'Summary','Protocol1',2, '08-AUG-17 03.36.41.318000000 PM', '08-AUG-17 03.36.41.318000000 PM','Kushal', 'Adhvaryu','No'); 


select count(distinct(log_date)) from editlog where protocol_id =2;
select min(log_date) from editlog where protocol_id = 2;
delete from editlog where
log_date = (select min(log_date) from editlog where protocol_id = 2)
and protocol_id = 2;




--------------------- Protocol Table
-- DROP Table Protocol 
DROP TABLE protocol;
DROP sequence sequence_protocol;

-- Protocol Create Sequence
Create sequence sequence_protocol start with 1
  increment by 1
  minvalue 1;
  
-- Create Table Protocol
CREATE TABLE protocol
    (
      protocol_id  NUMBER(3) CONSTRAINT pro_pid_pk PRIMARY KEY ,
      protocol_name VARCHAR2(75char) NOT NULL,
      protocol_source varchar2(25char) DEFAULT ON NULL 'None'
    );

-- INSERT into Table Protocol
INSERT INTO protocol (protocol_id, protocol_name, protocol_source) 
VALUES 
(sequence_protocol.NEXTVAL, 'First protocol', 'Word');

INSERT INTO protocol (protocol_id, protocol_name, protocol_source) 
VALUES 
(sequence_protocol.NEXTVAL, 'Second protocol', 'Word');

INSERT INTO protocol (protocol_id, protocol_name, protocol_source) 
VALUES 
(sequence_protocol.NEXTVAL, 'Third protocol', ' ');
 

-- Fetch Sequence number.
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
(sequence_billing.NEXTVAL, '73700C CT Lower Ext WO/CST Left 73700D CT Lower Ext WO/CST Right',46);

--------------------- Device Name Table
-- DROP Table and Sequence device name 
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
      does_alert_value NUMBER(5,2) DEFAULT ON NULL 0 ,
      instructions VARCHAR2(250char) NOT NULL,
      topogram VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      excel_reference NUMBER(4) DEFAULT ON NULL 0,
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
      oral_contrast VARCHAR2(75char)DEFAULT ON NULL 'None' ,
      oral_contrast_notes VARCHAR2(250char) DEFAULT ON NULL 'None' ,
      iv_contrast VARCHAR2(75char) DEFAULT ON NULL 'None' ,
      iv_contrast_notes VARCHAR2(250char) DEFAULT ON NULL 'None' ,
      injection_rate VARCHAR2(75char) DEFAULT ON NULL 'None' ,
      injection_rate_notes VARCHAR2(250char) DEFAULT ON NULL 'None' ,
      medication_url  VARCHAR2(250char) DEFAULT ON NULL 'None' ,
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
      scout_direction VARCHAR2(45char)  DEFAULT ON NULL 'None',
      scout_start  VARCHAR2(45char) NOT NULL,
      scout_end  VARCHAR2(45char) NOT NULL,
      scout_plane  VARCHAR2(45char)NOT NULL,
      scout_ww_wl  VARCHAR2(45char)  DEFAULT ON NULL 'None',
      scout_kernel  VARCHAR2(45char)  DEFAULT ON NULL 'None',
      scout_destination  VARCHAR2(45char) NOT NULL,
      scout_length VARCHAR2(45char)  DEFAULT ON NULL 'None',
      excel_reference NUMBER(4)  DEFAULT ON NULL 0,
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT sco_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
      
    );  

-- INSERT Into Scout
INSERT INTO scout  
VALUES 
(sequence_scout.NEXTVAL, 'Type', 1.2,2.3, 'Direction', 'Start', 'End', 'Plane', 
 'Window', 'Kernel','Destination', 1, 2,1);
 

 
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
      scan_direction  VARCHAR2(45char)  DEFAULT ON NULL 'None',
      scan_thickness  NUMBER(5,2)  NOT NULL,
      scan_interval  NUMBER(5,2)  NOT NULL,
      rotation_length  VARCHAR2(45char)  DEFAULT ON NULL 'None',
      detector_coverage VARCHAR2(45char)  DEFAULT ON NULL 'None',
      pitch NUMBER(5,2)  NOT NULL,
      speed NUMBER(5,2)  NOT NULL,
      tilt NUMBER(5,2)  DEFAULT ON NULL 0,
      sfov VARCHAR2(45char)  NOT NULL,
      care_dose4d VARCHAR2(45char)  NOT NULL,
      care_kv VARCHAR2(45char)  NOT NULL,
      dose_optimized_level NUMBER(5,2)  NOT NULL,
      dual_energy VARCHAR2(45char)  DEFAULT ON NULL 'None',
      hi_res VARCHAR2(45char)  DEFAULT ON NULL 'None',
      cardiac VARCHAR2(45char)  DEFAULT ON NULL 'None',
      number_of_scans NUMBER(5,2)  DEFAULT ON NULL 0,
      feed NUMBER(5,2) DEFAULT ON NULL 0,
      ref_qrm NUMBER(5,2) DEFAULT ON NULL 0,
      ref_kv VARCHAR2(45char)  DEFAULT ON NULL 'None',
      scan_description VARCHAR2(250char)  NOT NULL,
      ctdivol VARCHAR2(45char) DEFAULT ON NULL 'None',
      excel_reference NUMBER(4) DEFAULT ON NULL 0,
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
      dfov NUMBER(5,2) DEFAULT ON NULL 0 ,
      a_p_center VARCHAR2(45char) DEFAULT ON NULL 'None',
      r_l_center VARCHAR2(45char) DEFAULT ON NULL 'None',
      thickness NUMBER(5,2) DEFAULT ON NULL 0 ,
      recon_interval NUMBER(5,2) DEFAULT ON NULL 0 ,
      recon_algorithm  VARCHAR2(45char) NOT NULL,
      ww_wl  VARCHAR2(45char)  NOT NULL,
      safire  VARCHAR2(45char) DEFAULT ON NULL 'None'  ,
      safire_strength  VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      recon_fast VARCHAR2(45char) DEFAULT ON NULL 'None',
      recon_kernel VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      recon_slice_data VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      recon_type VARCHAR2(45char) NOT NULL,
      recon_region VARCHAR2(45char)  NOT NULL,
      recon_axis VARCHAR2(45char)  NOT NULL,
      threed_type VARCHAR2(45char)  NOT NULL,
      image_order VARCHAR2(45char)  NOT NULL,
      asir VARCHAR2(45char) DEFAULT ON NULL 'None',
      destinations VARCHAR2(45char) NOT NULL,
      increments NUMBER(5,2) NOT NULL,
      fov NUMBER(5,2) NOT NULL,
      slice NUMBER(5,2) NOT NULL,
      window VARCHAR2(45char) DEFAULT ON NULL 'None',
      noise_supression VARCHAR2(45char) DEFAULT ON NULL 'None',
      excel_reference NUMBER(4) DEFAULT ON NULL 0,
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
      eff_mas VARCHAR2(45char) DEFAULT ON NULL 'None',
      kv VARCHAR2(45char) DEFAULT ON NULL 'None',
      routine_delay NUMBER(4) DEFAULT ON NULL 0,
      slice VARCHAR2(45char) DEFAULT ON NULL 'None',
      dose_notification_value NUMBER(5,2) DEFAULT ON NULL 0,
      x_care VARCHAR2(45char) DEFAULT ON NULL 'None',
      range_4d VARCHAR2(45char) DEFAULT ON NULL 'None',
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
      mas NUMBER(5,2) DEFAULT ON NULL 0,
      kv NUMBER(5,2) DEFAULT ON NULL 0,
      bolus_delay NUMBER(5,2) DEFAULT ON NULL 0,
      bolus_trigger NUMBER(5,2) DEFAULT ON NULL 0,
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT bol_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Bolus Tracking
INSERT INTO bolus_tracking  
VALUES 
(sequence_bolus_tracking.NEXTVAL, 0, 0, 0, 0, 46);

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
      dfov NUMBER(5,2) DEFAULT ON NULL 0,
      a_p_center VARCHAR2(45char) DEFAULT ON NULL 'None',
      r_l_center VARCHAR2(45char) DEFAULT ON NULL 'None',
      thickness NUMBER(5,2) DEFAULT ON NULL 0 ,
      recon_interval NUMBER(5,2) DEFAULT ON NULL 0,
      recon_algorithm  VARCHAR2(45char) NOT NULL,
      ww_wl  VARCHAR2(45char)  NOT NULL,
      safire  VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      safire_strength  VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      recon_fast VARCHAR2(45char) DEFAULT ON NULL 'None',
      recon_kernel VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      recon_slice_data VARCHAR2(45char) DEFAULT ON NULL 'None' ,
      recon_type VARCHAR2(45char) NOT NULL,
      recon_region VARCHAR2(45char)  NOT NULL,
      recon_axis VARCHAR2(45char)  NOT NULL,
      threed_type VARCHAR2(45char)  NOT NULL,
      image_order VARCHAR2(45char)  NOT NULL,
      asir VARCHAR2(45char) DEFAULT ON NULL 'None',
      destinations VARCHAR2(45char) NOT NULL,
      increments NUMBER(5,2) NOT NULL,
      fov NUMBER(5,2) NOT NULL,
      slice NUMBER(5,2) NOT NULL,
      window VARCHAR2(45char) DEFAULT ON NULL 'None',
      noise_supression VARCHAR2(45char) DEFAULT ON NULL 'None',
      excel_reference NUMBER(4) DEFAULT ON NULL 0,
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
      pdf_name VARCHAR2(250char) DEFAULT ON NULL 'None',
      pdf_version NUMBER(8,3) DEFAULT ON NULL 1,
      pdf_url VARCHAR2(250char) DEFAULT ON NULL 'None',
      protocol_id_protocol NUMBER(3) NOT NULL CONSTRAINT mda_pid_fk 
        REFERENCES protocol(protocol_id) ON DELETE cascade
    );  

-- INSERT Into Media
INSERT INTO media  
VALUES 
(sequence_media.NEXTVAL, 'doc1', '1.2.3','C:/abc/xyz.pdf',2);

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

DROP sequence sequence_local_radiograph;

Create table username
  (
      user_id  NUMBER(4) CONSTRAINT un_uid_pk PRIMARY KEY ,
      protocol_id NUMBER(4),
      firstName VARCHAR2(250char) DEFAULT ON NULL 'None',
      lastName VARCHAR2(250char) DEFAULT ON NULL 'None'
      
    );  

Drop table username;  
INSERT into username
VALUES
(1,1,'Kushal','Adhvaryu');
INSERT into username
VALUES
(2,1,'Santosh','Bidve');
INSERT into username
VALUES
(3,1,'Hitendra','Shukla');
INSERT into username
VALUES
(4,2,'Mohamad','Shekh');
INSERT into username
VALUES
(5,2,'Mohseen','Mukkadam');


Create table tmp_username
  (
      tmp_id  NUMBER(4) CONSTRAINT tun_uid_pk PRIMARY KEY ,
      user_id NUMBER(4),
      protocol_id NUMBER(4),
      change_req_id NUMBER(4),
      firstName VARCHAR2(250char) DEFAULT ON NULL 'None',
      lastName VARCHAR2(250char) DEFAULT ON NULL 'None'
      
    );  
  
Drop table tmp_username;
---- Create a row in temp table.
INSERT into tmp_username
VALUES
(1, 1, 1, 1,'Kushal','Dholakia');

-- Insert above created row in persistent table.
INSERT into username (user_id,firstName, lastName, role)
SELECT user_id, firstName,lastName, role from tmp_username where tmp_username.user_id = 1;

--- Creates a record to update username.
INSERT into tmp_username
VALUES
(3,1, 'Hitendra','Shukla','Doctor');

-- Updates row id =1 in username table copying values from row id=2 in tmp table.
UPDATE username SET( firstName, lastName) = 
(Select tmp_username.firstName, tmp_username.lastname from tmp_username ,username
where 
username.user_id = tmp_username.user_id and
username.protocol_id = tmp_username.protocol_id and
tmp_username.change_req_id = 1)
where
user_id = (Select tmp_username.user_id from tmp_username ,username
where 
username.user_id = tmp_username.user_id and
username.protocol_id = tmp_username.protocol_id and
tmp_username.change_req_id = 1);

Select tmp_username.firstName, tmp_username.lastname from tmp_username , username
where 
username.user_id = tmp_username.user_id and
username.protocol_id = tmp_username.protocol_id and
tmp_username.change_req_id = 1;

Select tmp_username.user_id from tmp_username ,username
where 
username.user_id = tmp_username.user_id and
username.protocol_id = tmp_username.protocol_id and
tmp_username.change_req_id = 1;

select billing.billing_id, protocol.protocol_name, billing.charge from protocol, billing 
where
billing.protocol_id_protocol =protocol.protocol_id and
billing.protocol_id_protocol IN (41,46) order by protocol.protocol_name asc;

select * from billing where protocol_id_protocol in (41,46);


select bill.billing_id, protocol.protocol_name, bill.charge from protocol JOIN billing bill ON bill.protocol_id_protocol =protocol.protocol_id where bill.protocol_id_protocol IN (41,46) order by protocol.protocol_name asc;

select bolus.bolus_tracking_id, protocol.protocol_name, bolus.mas, bolus.kv, bolus.bolus_delay, bolus.bolus_trigger, bolus.protocol_id_protocol from protocol join bolus_tracking bolus where bolus.protocol_id_protocol = protocol.protocol_id and bolus.protocol_id_protocol IN (41) order by protocol.protocol_name asc;