import cx_Oracle

# connect via SQL*Net string or by each segment in a separate argument
#connection = cx_Oracle.connect("user/password@TNS")
connection = cx_Oracle.connect("ANONYMOUS", "mayo", "mayo")

cursor = connection.cursor()
# cursor.execute("""
#         select *
#         from protocol
#         """)

seq = "Select sequence_protocol.NEXTVAL From dual"
cursor.execute(seq)

protocol = "From python"
source = "word"
id_index = cursor.fetchone()[0]
query = "INSERT INTO protocol VALUES(:id,:protocol,:source)"
args = {'id':id_index, 'protocol': protocol, 'source': source}
cursor.execute(query, args)
connection.commit()

cursor.execute("""
        select *
        from protocol
        """)
rows = cursor.fetchall()
print "Protocol"
print('Total Row(s):', int(cursor.rowcount + 1))

for row in rows:
    print(row)

cursor.close()
connection.close()
