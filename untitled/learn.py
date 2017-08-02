# Reading JSON
# import requests
# import json
#
# r = requests.get("https://api.themoviedb.org/3/movie/2?api_key=919ed67d90865cd25eafbf9ef1e57264")
# r.text
#
# print "Response data : " + r.text
#
# data = json.loads(r.text)
#
#
# print data
# print data['poster_path']
# print data['production_countries'][0]['iso_3166_1']


# Using PyDocX to convert doc to html
# from pydocx import PyDocX
#
# # Pass in a path
# html = PyDocX.to_html('test.docx')
#
# print(html)

# Create excel using openpyxl
# from openpyxl import Workbook
# wb = Workbook()
# print(wb.sheetnames)
# ws = wb.active
# c = ws['A1']
# print(c)

# read excel using library
# from openpyxl import load_workbook
# wb = load_workbook(filename='practice.xlsx', read_only=True)
# ws = wb['Sheet1']
# print(ws.calculate_dimension())
# for row in ws.rows:
#     print("\n")
#     for cell in row:
#        print(cell.value)

# Read cell using library
# from openpyxl import load_workbook
# wb1 = load_workbook(filename='practice.xlsx')
# sheet_ranges = wb1['Sheet1']
# print(sheet_ranges['A3'].value)
#
# import docx
# doc = docx.Document("test.docx")
# print(len(doc.paragraphs))
# for i in range(len(doc.paragraphs)):
#     print i
#     print(doc.paragraphs[i].text)

# # for k in range(len(doc.tables)):
# #     for i in range(doc.)
# tables = doc.tables
# for table in tables:
#     for row in table.rows:
#         for cell in row.cells:
#            # for paragraph in cell.paragraphs:
#                 print(cell.text)

# import docx2txt
#
# # extract text
#
# text = docx2txt.process("test5.docx", "C:\\Users\\kadhvary\\PycharmProjects\\untitled\\output")
# print(text)
# if 'Coverage:' in text:
#     print"Hurray!"
import re

string = ['120 140 metal', '0']
for i in range(len(string)):
    print re.search('[a-zA-Z]', string[i])
