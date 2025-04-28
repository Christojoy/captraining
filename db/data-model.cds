namespace DataBase;
using { managed,cuid,Currency } from '@sap/cds/common';


entity Customers{
    key Id :String;
        Name:String;
}

entity Books : managed {
  key ID : Integer;
  @mandatory title  : String(111);
  descr  : String(1111);
  @mandatory author : Association to Authors;
  // genre  : Association to Genres
  stock  : Integer;
  price  : Decimal;
  currency : Currency;
}

entity Authors : managed {
  key ID : Integer;
  @mandatory name   : String(111);
  dateOfBirth  : Date;
  dateOfDeath  : Date;
  placeOfBirth : String;
  placeOfDeath : String;
  // books  : Association to many Books on books.author = $self
}

/** Hierarchically organized Code List for Genres */
entity Genres  {
  key ID   : Integer;
      name : String;
      parent   : Integer;
  // children : Composition of many Genres on children.parent = $self
}
