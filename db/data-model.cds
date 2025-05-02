namespace DataBase;

using
{
    managed,
    cuid,
    Currency
}
from '@sap/cds/common';

entity Customers
{
    key Id : String;
    Name : String;
}

entity Books : managed
{
    key ID : Integer;
    title : String(111)
        @mandatory;
    descr : String(1111);
    author : Association to one Authors
        @mandatory;
    stock : Integer;
    price : Decimal;
    currency : Currency;
}

entity Authors : managed
{
    key ID : Integer;
    name : String(111)
        @mandatory;
    dateOfBirth : Date;
    dateOfDeath : Date;
    placeOfBirth : String;
    placeOfDeath : String;
    books : Association to many Books on books.author = $self;
}

/**
 * Hierarchically organized Code List for Genres
 */
entity Genres
{
    key ID : Integer;
    name : String;
    parent : Integer;
}
