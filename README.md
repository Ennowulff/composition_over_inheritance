# composition_over_inheritance
Discussion and solutions to "composition over inheritance"

https://keremkoseoglu.wordpress.com/2024/01/08/suggestions-for-better-object-oriented-design/

Chapter "Avoid inheritance"

# goal
Build a realistic example that has nothing to with animals or flight data

show and discuss solutions with these paterns:
* inheritance [01](https://github.com/Ennowulff/composition_over_inheritance/tree/main/src/coi_01)
* composition
* servant

## further changes
the solutions might stand the following changes:
* new method get_revenue_by_country
* 

# know inadequacies
the methods concerning the documents should be encapsuled in a separate class that manages the table access and actions. But this would make the example even more complex.


# example

The following assumptions are made to define an example that is on one hand simple enough to understand and on the other hand complex enough to show the advantages and disadvantages of a proposed solution.

There is an organizational object like "area".
There are objects and structures linked to this area.
The objects are abstract to keep the example simple.

the following actions can be executed to an area object

* get_name display the name of the area
* get_documents return all documents assigned to this area
* add_document add a document to the area
* delete_document remove a document
* get_responsible_person
* get_assigned_countries
* display display all information needed to this area

* Factory method to create an instance for each area

# report for testing

PROG ZCOI01_AREA_DEMO01: Enter area code and execute.
The report will create an instance of the desired area class, add some documents, call the display method and list all documents.

# general actions

## get_Documents 
reads documents from table documents for specified area

## add_document
adds document to table with specific area

## delete_document
deletes the specified document 

## get_assigned_countries
returns the specified countries. 

## display
display: 
- area name
- responsible persons
- assigned countries
- number of documents

# specific actions

## area A
Name Avaloria

assigned countries: DE, CH, AT

Responsible person: Aaron

get_documents: only documents having status released

Display: additional display of number of documents status 
* released
* open

## area B
Name Brythoria

Assigned countries: ES, PT, FR

delete_document not allowed in FR due to legal reasons

Responsible person: Bernard

Display: Display telephone number of responsible person

## area C
Name Celestria

Assigned countries: PL, RO

Responsible person: Carolina 

add_documents: force status draft. only allowed if there are no other documents with status draft

## area D
Name Draconia

Assigned countries: IT, GR

Responsible person: Dania

Documents: has always two templates in status released:
* template for technician
* template for customer

# organization

there are 4 areas:
A, B, C and D

## structures

document
* doc_number (key)
* title
* status
  * open
  * released
  * draft

## tables

documents
* area (key)
* structure: document
