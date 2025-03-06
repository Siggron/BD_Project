import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="clamideo",
    password="clamideo",
    database="loja"
)

# Criar um cursor para executar consultas
cursor = db.cursor()

import csv

# Caminho para o ficheiro CSV
csv_file = r'[root_path]\Dataset.csv'

# Abrir o ficheiro CSV
with open(csv_file, 'r', encoding="utf-8") as file:
    # Ler o ficheiro CSV
    csv_reader = csv.reader(file, delimiter=';')

    # Saltar o cabeçalho do ficheiro
    next(csv_reader)

    # Iterar sobre as linhas do ficheiro
    for row in csv_reader:
        # Extrair os dados de cada coluna
        nome = str(row[0])[:50]  # Limitar a 50 caracteres
        generos = row[1]
        esrb = str(row[2])[:8]   # Limitar a 8 caracteres
        plataforma = row[3]
        publicadora = str(row[4])[:30]  # Limitar a 30 caracteres
        desenvolvedores = row[5].replace(" / ", ",")  # Substituir " / " por ","
        ano_lanc = int(row[6]) if row[6].isdigit() else 0  # Atribuir 0 se o valor for inválido ou vazio
        preco = float(row[7])
        qtd = int(row[8])

        # Invocar o procedimento RegistarJogo passando os dados do jogo
        cursor.callproc('RegistarJogo', [nome, esrb, plataforma, publicadora, ano_lanc, preco, qtd, generos, desenvolvedores])

        # Commit para guardar as alterações
        db.commit()
