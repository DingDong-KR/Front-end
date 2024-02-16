import csv
import sqlite3

# 데이터베이스에 연결
con = sqlite3.connect('chart.db')
cursor = con.cursor()

with open('KCD-8_DB_Masterfile.csv', 'r') as file:
    csv_data = csv.reader(file)
    for row in csv_data:
        if not(row[0]):
            break
        cursor.execute('INSERT INTO diseaseList (diseaseCode, koreanName, englishName, completeness) VALUES (?, ?, ?, ?)', row)

#csv 파일 읽기 및 데이터베이스에 삽입
with open('KCD-8_신생물의_형태분류.csv', 'r') as file:
    csv_data = csv.reader(file)
    for row in csv_data:
        if not(row[0]):
            break
        cursor.execute('INSERT INTO diseaseList (diseaseCode, koreanName, englishName) VALUES (?, ?, ?)', row)

#변경사항 저장 및 연결 종료
con.commit()
con.close()