#Documentation pour la création d'un site internationalisé
La gem i18n permet l'internationalisation d'un site internet. Par internationalisation je signifie le fait d'un site internet peut être consulté en anglais, français etc.<br>
Je vais expliquer au sein de ce readme la manière dont j'ai procédé.<br>
Les ressources que j'ai utilisé pour arriver à ce but sont:<br>

Rails 4 begin <br>
Railscast<br>
RailsGuides<br>

## KATA

1. Generation du site 
```
$ rails new blog

```
<br>
2.Creation du controller et une action index

```
cd blog 
rails g controller Bonjour index

```
3.Inclure gem i18n dans le Gemfile puis bundle install et update

>Gemfile

```
gem 'i18n'
```

>Terminal

```
$ bundle install ; bundle update
```

<br>

4.Mise de la root de base a Bonjour index

<br>
>config/routes.rb
<br>
```
root "bonjour#index"

```
<br>
5.Créer les fichier de traduction en format yml dans les locales

>config/locales

```
touch config/locales/fr.yml #Creation traduction francais
touch config/locales/br.yml #Creation traduction Brezilien

```

6.Créer la config pour la gem i18n <br>

Dans le helper application créer une forme de selecteur de langues<br>
Coder<br>

>app/helpers/application_helper.rb

```
    def language_selector


        if I18n.locale == :en
            link_to "Fr", url_for(:locale => 'fr')
        else
            link_to "Br", url_for(:locale => 'br')
            link_to "En", url_for(:locale => 'en')
        end
    end

```
Ensuite spécifier la langue de l'application rails et ou elle devra charger les fichiers de traduction.<br>
Pour cette étape il s'agit de décommenter les lignes suivantes dans le fichier config/application.rb<br>

>config/application.rb

```
     config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
     config.i18n.default_locale = :fr
```
La variable config.i18n.default_locale est généralement configuré a :en , je l'ai mise à :fr

7.Faire les traductions

Ce que je souhaite faire est d'afficher "bonjour" en plusieurs langues. Je travaille sur les fichiers de traduction.<br>
ATTENTION LE FORMAT YML EST SENSIBLE A LA CASSE.<br> 

Codez

>config/locales/fr.yml

```
fr:
  hello: "Bonjour le monde!"

```

>config/locales/en


```
en:
  hello: "Hello world"

```


>config/locales/br

```
br:
  hello: "Hola mundo!"

```


8.Travailler la vue pour traduction. <br>

La gemme i18n utilise une varible clé pour tout ce qui est traduction, nommée "t" pour translate.<br>
Elle est à mettre à chaque élément à traduire.<br>

>app/views/bonjour/index.html.erb

```
<h1>Bonjour#index</h1>
<p><%= t('hello') %></p>

<%= language_selector %>

```


