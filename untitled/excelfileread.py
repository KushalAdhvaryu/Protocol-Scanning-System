from openpyxl import load_workbook
wb = load_workbook(filename='test_excel.xlsx', read_only=True)
ws = wb['Sheet1']
rows = ws.calculate_dimension()
rows = int(rows.split("T")[-1]) - 2
print rows

# isFirstline  = True
# lables = []
# i = 1
# count = 0
# for row in ws.rows:
#     print i
#     if i < 3:
#         for cell in row:
#             if isFirstline:
#                 lables.append(cell.value)
#             if cell.value is not None:
#                 print cell.value,
#             else:
#                 count += 1
#     isFirstline = False
#     i += 1
# print "Count"
# print count
# for word in lables:
#     print word,