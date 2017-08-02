import mysql.connector
from mysql.connector import Error


def connect():
    """ Connect to MySQL database """

    try:
        conn = mysql.connector.connect(host='127.0.0.1',
                                       database='protocol',
                                       user='root',
                                       password='1234')
        if conn.is_connected():
            print('Connected to MySQL database')

        cursor = conn.cursor()
        cursor.execute("SELECT * FROM protocol")

        rows = cursor.fetchall()

        print('TOtal Row(s):', cursor.rowcount)

        for row in rows:
             print(row)

        #Insert Data into Row. Refer : http://www.mysqltutorial.org/python-mysql-insert/
        # query = "INSERT INTO books(title,isbn) VALUES(%s,%s)"
        # args = ('A Sudden Light', '9781439187036')
        # cursor.execute(query,args)
        #
        # if cursor.lastrowid:
        #     print('last insert id', cursor.lastrowid)
        # else:
        #     print('last insert id not found')
        #
        # conn.commit()

        # update Data in row . Refer: http://www.mysqltutorial.org/python-mysql-update/
        # query = "UPDATE books SET title = %s WHERE id = %s"
        # data = ( 'The Giant on the Hill *** TEST ***',37)
        # cursor.execute(query,data)
        # conn.commit()

        #Delete row from table. Refer: http://www.mysqltutorial.org/python-mysql-delete-data/
        # query = "DELETE FROM books WHERE id = %s"
        # bookid = 84
        # cursor.execute(query, (bookid,) )
        # conn.commit()

        # Working with Stored procedure. Refer: http://www.mysqltutorial.org/calling-mysql-stored-procedures-python/
        # Procedure without arguments.
        # cursor.callproc('find_all')
        # for result in cursor.stored_results():
        #     print(result.fetchall())
        #
        # #Procedure with arguments.
        # args = ['1236400967773', 0]
        # result_args = cursor.callproc('find_by_isbn', args)
        # print(result_args[1])

        # Working with BLOB data type.

        #Upload a photo to database.
        # filename = "C:\Users\kadhvary\PycharmProjects\untitled\pictures\garth_stein.jpg"
        # data = read_file(filename)
        #author_id = 1
        # query = "UPDATE authors SET photo = %s WHERE id  = %s"
        # args = (data, author_id)
        # cursor.execute(query, args)127.0.0.1
        # conn.commit()

        # Read photo from database.
        # query = "SELECT photo FROM authors WHERE id = %s"
        # cursor.execute(query,(author_id,))
        # photo = cursor.fetchone()[0]

        #write_file(photo, "C:\Users\kadhvary\PycharmProjects\untitled\output\garth_stein.jpg" )
    except Error as e:
        print(e)

    finally:
        cursor.close()
        conn.close()


if __name__ == '__main__':
    connect()