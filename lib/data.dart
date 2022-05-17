
int counter = 0;
List<int> savesList = <int>[];
int savesListIndex = 0;

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
  savesList.insert(savesListIndex, counter);
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

List<int> GetSaveList(){
  return savesList;
}

void SetSaveList(List<int> newSaveList){
  savesList.addAll(newSaveList);
  savesListIndex = savesList.length;
}


