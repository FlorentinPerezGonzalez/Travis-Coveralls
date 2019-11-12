##Florentín Pérez González 13/11/19
# Gema: Food

Food es una gema que permite la utilización de una clase cuyos instancias son, en la práctica, simulaciones de alimentos. Estos se caracterizarán por una definición basada en la cantidad de nutrientes (proteínas, lípidos y carbohidratos), así como la media de gases de efecto invernadero (en kg) generados para la producción del correspondiente alimento y los metros cuadrados necesarios para su producción anual. 

## Instalación

Para usar la gema basta con añadir la siguiente línea al archivo Gemfile de la apliación:

```ruby
gem 'food'
```

Posteriormente ejecute:

    $ bundle

O realize manualmente la instalación:

    $ gem install food

## Uso

La recreación de alimentos se realiza mediante la instanciación de objetos de la clase "Food". Cada objeto requiere un único argumento para poder construirse. Este se trata de un "Hash" de 6 valores que especifican el nombre del alimento, sus proteínas; lípidos, carbohidratos, gases de efecto invernadero generados para su elaboración y los metros cuadrados de tierra necesarios.   
En la siguiente línea se muestra un ejemplo:

```ruby
    basic_food = Food::Food.new({:name => 'Huevos', :protein => 13.0, :carbohydrates => 1.1, :lipids => 11.0, :gas => 4.2, :land_use => 5.7})
```
Una vez instanciado, cada objeto sirve como una representación abstracta de los alimentos que se hayan decidido recrear. El usuario puede, además, obtener los datos definidos para cada objeto a través de métodos "Getters" del mismo nombre que reciben los atributos. De igual manera, el usuario puede hacer uso del método `energetic_value` para obtener el aporte energético del alimento.

Adicionalmente, el usuario puede hacer uso de `portion_impact` para obtener el impacto medioambiental de una porción del alimento que represente el objeto. Esta método devuelve un array de dos elementos numéricos donde el primero se corresponde con el impacto en gases de efecto invernadero y el segundo con la cantidad de metros cuadrados de tierra necesaria para la creación de la porción. Para su correcto funcionamiento, el método debe recibir un único atributo, un valor númerico que indica los gramos de proteínas que contendrá la supuesta porción.

```html
    <pre>2.6.3 :002 &gt; @basic_food.portion_impact(100)
 =&gt; [0.32308e2, 0.43846e2] 
2.6.3 :003 &gt; </pre>

```

## Desarrollo

Las depedencias pueden ser instaladas mediante la ejecución de `bin/setup`. Las pruebas pueden ser ejecutadas mediante el `rake spec`. De igual manera puede hacerse uso de `bin/console` para una trabajar experimentalmente de forma dinámica.

Para instalar la gema en tu máquina local, ejecuta `bundle exec rake install`. Para lanzar una nueva versión, actualiza el número en `version.rb`, y ejecuta posteriormente `bundle exec rake release`, hecho que permitirá subir el archivo `.gem` a [rubygems.org](https://rubygems.org).

