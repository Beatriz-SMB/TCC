import random

caminho = r"C:\Users\Beatriz\Desktop\TCC\16 bits\resultado.txt"

with open(caminho, "w") as arquivo:
    arquivo.write("Cin  A  B  Cout  Sum\n")

    for indice in range(1000):
        cin = random.randint(0, 1)
        a = random.randint(0, 65535)
        b = random.randint(0, 65535)

        resultado = cin + a + b

        cout = resultado // 65536 # divisão inteira para obter o carry out
        soma = resultado % 65536 # resto da divisão para obter a soma de 16 bits

        arquivo.write(
            f"{indice} {cin} {a} {b} {cout} {soma}\n"
        )