# Solidity Smart Contract Sample

Este projeto é um exemplo de caso de uso de um Smart Contract em Solidity com Hardhat. Foi feito como projeto das aulas da comunidade [Web3Dev](https://build.w3d.community/courses/Solidity_And_Smart_Contracts)

## Tecnologias Utilizadas

Essas são as tecnologias principais utilizadas neste projeto:

[Solidity](https://soliditylang.org/)
[HardHat](https://hardhat.org/)
[JavaScript](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript)
[Ethereum](https://ethereum.org/pt-br/)

# Instalação e Configuração do Projeto Hardhat

## Pré-requisitos

1. [Instale o NVM](https://github.com/nvm-sh/nvm)
2. Instale o Node.js:
    
    ```
    nvm install node
    nvm use node
    ```
    
    > Nota: Usei o Node 12
    > 

## Criando o Projeto

1. Crie uma pasta para o projeto e acesse-a:
    
    ```
    mkdir meu-projeto
    cd meu-projeto
    
    ```
    
2. Crie uma estrutura de projeto Node, base:
    
    ```
    npm init -y
    
    ```
    
3. Instale a dependencia do Hardhat:
    
    ```
    npm install --save-dev hardhat@2.15.0
    
    ```
    

## Estrutura Base do Hardhat

1. Inicie a estrutura base do Hardhat:
    
    ```
    npx hardhat
    
    ```
    
2. Selecione TypeScript ou JavaScript conforme preferir.

## Instale a Toolbox

Caso não tenha sido instalada automaticamente:

```
npm install --save-dev "hardhat@^2.15.0" "@nomicfoundation/hardhat-toolbox@^3.0.0"

```

## Comandos do Hardhat

1. Iniciar uma blockchain local:
    
    ```
    npx hardhat node
    
    ```
    
    > Nota: Gera endereços Ethereum simulando usuários reais.
    > 
2. Compilar o projeto:
    
    ```
    npx hardhat compile
    
    ```
    
3. Executar testes automatizados:
    
    ```
    npx hardhat test
    
    REPORT_GAS=true npx hardhat test
    ```
    
4. Executar o script `run.js` que faz deploy do contrato na blockchain local e executa testes:
    
    ```
    npx hardhat run scripts/run.js
    
    ```
    
5. Implantar contrato na blockchain local Hardhat:
    
    ```
    npx hardhat run scripts/deploy.js --network localhost
    
    ```
    
    > Nota: Para que esse deploy funcione, é necessário estar com a blockchain local rodando, através do comando do item 1
    > 
6. Implantar contrato na TestNet Sepolia:
    
    ```
    npx hardhat run scripts/deploy.js --network sepolia
    
    ```
    

## Ferramentas e Recursos

- [Etherscan Sepolia](https://sepolia.etherscan.io/)
    
    > Etherscan é uma ferramenta para visualizar o estado da blockchain e detalhes das transações.
    > 
- [Chainlink - ETH Fake](https://faucets.chain.link/sepolia)
    
    > Obtenha ETH falso para testes.
    > 
- [Alchemy](https://www.alchemy.com/)
    
    > Crie uma conta e configure uma chave de API para a rede de deploy.
    > 

## Deploy na Rede Ethereum Real

1. Crie uma conta na Alchemy.
2. Configure uma chave de API para a rede desejada.
    
    > Nota: As Testnets, como a Sepolia, são clones da mainnet usadas para testes com ETH falso.
    > 

### Configuração do Deploy

No arquivo `hardhat.config.js`:

```
module.exports = {
  solidity: "0.8.0",
  networks: {
    sepolia: {
      url: "YOUR_ALCHEMY_API_URL",
      accounts: ["YOUR_PRIVATE_SEPOLIA_ACCOUNT_KEY"],
    },
  },
};

```

> Atenção: NÃO FAÇA COMMIT DESTE ARQUIVO NO GITHUB, pois ele contém sua chave privada. Utilize uma nova chave privada e carteira específicas para isso, não utilize sua carteira pessoal.
> 

## Configuração de Variáveis de Ambiente

Para as configurações de chaves no arquivo `hardhat.config.js`, foi utilizado o framework [dotenv](https://www.npmjs.com/package/dotenv). Portanto, basta criar um arquivo `.env` com as respectivas chaves e valores.

## App React no Replit

- [Portal React Ethereum Interaction](https://replit.com/@adrianoprezende/portal-react-ethereum-interaction?v=1#src/App.jsx)

## Extensões para VSCode

- [Hardhat Solidity Extension](https://marketplace.visualstudio.com/items?itemName=NomicFoundation.hardhat-solidity)
- [Solidity Extension](https://marketplace.visualstudio.com/items?itemName=JuanBlanco.solidity)

## Versões implantadas do projeto

WavePortal address - v1: 0xe17998fFE737f13c5967073269CfE5b8B4f4B00E

WavePortal address - v2: 0xA4E308edaD492d2B37943FeF2880181d8DDD50Ae

WavePortal address - v3: 0x4949B2CCbaF3bBf15d38A13Db0D557c68889A2E7

WavePortal address - v4: 0xc6e440a31aFE232AA9c5C61CA30c50d8c9124bA4

WavePortal address - v5: 0xe1679Ac0f7171deB40032B5e37d3Fafd1f05f26e

WavePortal address - v6: 0xbA2717Ba32410F651ECE74A75B12F4918FC03Cd4