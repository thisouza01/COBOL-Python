import csv
from faker import Faker
from random import randint

# ID para ser incrementado
ident = 0

faker = Faker()
fake = 'pt-BR'

# define arquivo
arq_csv = 'salarios.csv'
coluna = ['ID', 'Nome', 'Salario']
qnt_registro = 10
max_nome = 20

# cria arquivo
with open(arq_csv, 'w', newline='', encoding='utf-8') as arquivo:
    writer = csv.writer(arquivo)

    # cabeçalho
    writer.writerow(coluna)

    # dados
    for i in range(qnt_registro):
        while True:
            nome = faker.name()
            # verifica tamanho do nome
            if len(nome) <= max_nome:
                break

        # salario
        salario = randint(1000, 10000)
        
        # ID
        ident += 1

        # escreve os dados    
        writer.writerow([
            ident,
            nome,
            salario
            ])    

