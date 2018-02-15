class House{
  // fields
  Door door;
  Door[] doors;
  Staircase stairs;
  Window[] windows;
  
  // cstrs
  House(){
    door = new Door();
    stairs = new Staircase();
  }
  
  House(Door[] doors, Staircase stairs, Window[] windows){
    this.doors = doors;
    this.stairs = stairs;
    this.windows = windows;
  }
  
  // methods
  void construct(){
    // in loop
    doors[i].construct();
    stairs.construct();
  }
  
  // add additional methods and getters/setters
}