

int counter = 0;
List<String> savesList = <String>[];

void AddToCounter(){
  counter ++;
}

void SubFromCounter(){
  if(counter > 0) counter--;
}

void  ClearCounter(){
  counter = 0;
}

void SetCounter(String counterChange){
  counter = int.parse(counterChange);
}

String GetCounterValueString(){
  return counter.toString();
}

void AddCounterValueToSavesList(){
  savesList.insert(0, counter.toString());
}

String SavesListValueString(int index){
  if(index >  -1) {
    return savesList[index].toString();
  } else {
    return " ";
    }
  }

List<String> GetSaveList(){
  return savesList;
}

void SetSaveList(String string){
  savesList = <String>[];
  savesList.addAll(StringToList(string));
}

String ListToString(List<String> list){
  return list.join(",");
}

List<String> StringToList(String list){
  return list.split(",");
}

int GetItemCount(){
  if(savesList.length < 5){return savesList.length;}
  else{return 5;}

}
