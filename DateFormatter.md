# ExtractDateFormatter
Date formatter é a classe do modulo de extrato reponsavel por todas as formataçoes de data nele.

### Arquivos relacionados:
- ExtractDateFormatter.swift
- ExtractFormatBuilder.swift
- ExtarctLocaleOption.swift
- DateFormatterTests.swift

### Possui Teste unitario?
- [ ] Não
- [x] Sim. Se sim qual?<br> **R:** DateFormatterTests.swift

### Propriedade:
```swift
  static let share: ExtractDateFormatter
```

### Metodos:
A sequir os metodos presentes para uso dessa classe e sua funcionalidade.

```swift 
  func format(config: Configuration) -> String 
  //Descrição: 
  //Metodo usado para converter uma data (no tipo texto) para outra data com uma formataçao diferente.
  //
  //Parametros:
  //- config: Configuration 
  //  Model usada para construir a formatação.
  //
  //Retorno:
  //- Tipo: String
  //  Data Formata no formato esperado
```
  
```swift 
  func format(date: Date, toFormat: Configuration.DateConfig) -> String 
  //Descrição: 
  //Metodo usado para converter uma data (do tipo `Date`) em uma data formatada.
  //
  //Parametros:
  //- date: Date
  //- toFormat: Configuration.DateConfig
  //  Usa esse submodelo recebido, para que construa o formatador de conversao expecificado. 
  //
  //Retorno:
  //- Tipo: String
  //  Retorna a data formatada
```

```swift 
  func format(input: String, fromFormat: Configuration.DateConfig) -> Date? 
  //Descrição: 
  //Metodo usado para converter uma data inputada (no tipo texto) em uma data.
  //
  //Parametros:
  //- input: String
  //  Recebe a data que deve ser convertida no formato texto
  //- fromFormat: Configuration.DateConfig
  //  Usa esse submodelo recebido, para que construa o formatador de conversao expecificado e retorne a data no tipo esperado. 
  //
  //Retorno:
  //- Tipo: Date?
  //- Retorna a data no formato nativo para que seja convertido posteriormente.
```
