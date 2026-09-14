# PIA-Toolbox

Este repositório é destinado ao desenvolvimento de uma toolbox para sistemas fuzzy baseada no método PIA, desenvolvida como parte do meu Trabalho de Conclusão de Curso (TCC), sob orientação do professor Bruno Luiz Pereira, da Universidade de Brasília (UnB).

## Estrutura do Projeto

```text
src/
├── core/                          # Classes do sistema PIA
│   ├── PIAInput.m
│   ├── PIAMembershipFunction.m
│   ├── PIAOutput.m
│   ├── PIARule.m
│   └── PIASystem.m
│
├── engine/                        # Funções responsáveis pelo processamento do método PIA
│   ├── contr_var.m
│   ├── degmem.m
│   ├── fuzzyconfig.m
│   ├── fuzzyout.m
│   ├── lim_out.m
│   ├── location.m
│   └── Main.m
│
├── functions/                     # Funções auxiliares
│   └── runPIA.m
│
├── tests/                         # Scripts de teste manuais
│   ├── testCreation.m
│   └── testUpdateDelete.m
│
└── setupPIA.m                     # Função de setup (PATH)
```

## Execução

Com o MATLAB aberto na pasta src da toolbox, configure o MATLAB Path executando:

```matlab
setupPIA
```

Depois, um sistema PIA pode ser criado utilizando `PIASystem`:

```matlab
pia = PIASystem("Nome do Sistema");
```

## Resumo dos Comandos

| Comando | Descrição |
| ------- | --------- |
| `PIASystem("nome")` | Cria um novo sistema PIA |
| `setupPIA()` | Configura os caminhos necessários para a toolbox |
| `runPIA(pia, input)` | Executa o sistema e retorna a saída |
| `addInput(pia, "nome", range)` | Adiciona uma variável de entrada |
| `updateInput(pia, id, "nome", range)` | Atualiza uma variável de entrada |
| `deleteInput(pia, id)` | Remove uma variável de entrada |
| `addOutput(pia, "nome", range)` | Adiciona uma variável de saída |
| `updateOutput(pia, id, "nome", range)` | Atualiza uma variável de saída |
| `deleteOutput(pia, id)` | Remove uma variável de saída |
| `addMF(pia, "tipo", id, "tipoMF", parametros, "nome")` | Adiciona uma função de pertinência |
| `updateMF(pia, "tipo", id, idMF, "nome", "tipoMF", parametros)` | Atualiza uma função de pertinência |
| `deleteMF(pia, "tipo", id, idMF)` | Remove uma função de pertinência |
| `addRule(pia, antecedent, consequent)` | Adiciona uma regra ao sistema |
| `updateRule(pia, id, antecedent, consequent)` | Atualiza uma regra |
| `deleteRule(pia, id)` | Remove uma regra |

## Exemplo de Uso

Um sistema PIA pode ser criado utilizando `PIASystem`:

```matlab
pia = PIASystem("Vitalidade");
```

As entradas e saídas podem ser adicionadas com `addInput` e `addOutput`:

```matlab
pia = addInput(pia, "Água", [0 66]);
pia = addInput(pia, "Sol", [0 95]);

pia = addOutput(pia, "Vitalidade", [0 1]);
```

As funções de pertinência das entradas podem ser adicionadas com `addMF`:

```matlab
% Água
pia = addMF(pia, "input", 1, "trimf", [0 20 38], "pequena");
pia = addMF(pia, "input", 1, "trimf", [20 38 56], "média");
pia = addMF(pia, "input", 1, "trimf", [38 66 66], "grande");

% Sol
pia = addMF(pia, "input", 2, "trimf", [0 30 60], "pequeno");
pia = addMF(pia, "input", 2, "trimf", [30 60 90], "médio");
pia = addMF(pia, "input", 2, "trimf", [60 95 95], "grande");
```

As funções de pertinência da saída também podem ser adicionadas com `addMF`:

```matlab
pia = addMF(pia, "output", 1, "trimf", [0 0 0.2], "baixa");
pia = addMF(pia, "output", 1, "trimf", [0.1 0.5 0.9], "média");
pia = addMF(pia, "output", 1, "trimf", [0.8 1 1], "alta");
```

As regras são adicionadas utilizando `addRule`:

```matlab
pia = addRule(pia, [1 1], 2);
pia = addRule(pia, [1 2], 2);
pia = addRule(pia, [1 3], 1);
pia = addRule(pia, [2 1], 3);
pia = addRule(pia, [2 2], 3);
pia = addRule(pia, [2 3], 2);
pia = addRule(pia, [3 1], 1);
pia = addRule(pia, [3 2], 1);
pia = addRule(pia, [3 3], 1);
```

Por fim, o sistema pode ser executado com `runPIA`, informando os valores das entradas:

```matlab
saida = runPIA(pia, [50 70]);
```
