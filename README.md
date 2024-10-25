# DonMToken (Donm)

### Solidity Smart Contract para o token ERC-20

![License](https://img.shields.io/badge/license-GPL--3.0-blue)

---

## Índice
- [Introdução](#introdução)
- [Características do Token](#características-do-token)
- [Funcionalidades Principais](#funcionalidades-principais)

## Introdução

O **DonMToken (símbolo: Donm)** é um token baseado no padrão **ERC-20** desenvolvido em Solidity para Ethereum (ou redes compatíveis com EVM). Criado com um suprimento fixo de 10.000.000 unidades, ele aloca todo o estoque para o criador no momento do deployment, proporcionando controle inicial completo.

## Características do Token

- **Nome**: Donm Coin
- **Símbolo**: Donm
- **Decimais**: 2
- **Suprimento Total**: 10,000,000 (10 milhões de tokens)
- **Contrato**: Escrito em Solidity, baseado na interface padrão ERC-20.

## Funcionalidades Principais

Este contrato implementa todas as funções essenciais do ERC-20, incluindo:

1. **Transferência de Tokens**: Permite que o titular transfira tokens diretamente para outro endereço.
2. **Aprovação e Transferência de Delegação**:
   - `approve`: Permite que um titular aprove que outra conta use uma quantidade específica de seus tokens.
   - `transferFrom`: Permite que a conta aprovada realize a transferência em nome do titular.
3. **Consulta de Saldo e Suprimento**:
   - `totalSupply`: Informa o suprimento total de tokens emitidos.
   - `balanceOf`: Retorna o saldo de tokens de um endereço específico.
   - `allowance`: Mostra a quantidade permitida entre duas contas.
