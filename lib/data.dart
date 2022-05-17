import 'package:flutter/material.dart';

int counter = 0;
List<String> savesList = <String>[" "," "," "," "," "];
int savesListIndex = 0;

void AddToCounter(){
  counter ++;
}

void SubFromCounter(){
  counter--;
}

void  ClearCounter(){
  counter = 0;
}

String GetCounterValueString(){
  return counter.toString();
}

void AddCounterValueToSavesList(){
  savesList.insert(savesListIndex, counter.toString());
  savesListIndex ++;
}

String SavesListValueString(int index){
  if(index >  -1) {
    return savesList[index].toString();
  } else {
    return " ";
    }
  }

int SavesListIndex(){
  return savesListIndex;
}