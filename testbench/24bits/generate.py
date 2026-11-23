import random

caminho = r"C:\Users\Beatriz\Desktop\TCC\24 bits\resultado.txt"

with open(caminho, "w") as arquivo:
    arquivo.write("Cin  A  B  Cout  Sum\n")

    for indice in range(100000):
        cin = random.randint(0, 1)
        a = random.randint(0, 16777215)
        b = random.randint(0, 16777215)

        resultado = cin + a + b

        cout = resultado // 16777216 # divisão inteira para obter o carry out
        soma = resultado % 16777216 # resto da divisão para obter a soma de 24 bits

        arquivo.write(
            f"{indice} {cin} {a} {b} {cout} {soma}\n"
        )