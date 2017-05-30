class DemoFlower {

  private SacredPoint center;
  private float sized;
  private SacredCircle n, nw, sw, s, se, ne;
  private SacredThreshold threshold = new SacredThreshold(1.0, 100.0);
  
  // Factory Init
  DemoFlower(float _x, float _y, float _sized) {
    // Establish Size
    sized = _sized;
    // Center Point
    center = new SacredPoint(_x, _y);
    
    for (int i = 3; i < 9; i++) {
      // Distance from center point
      float delta = (sized / 2.0) - (threshold.max / 2.0);

      n  = new SacredCircle(centerPoint(delta, radiansForI(0)), threshold.min);
      nw = new SacredCircle(centerPoint(delta, radiansForI(1)), threshold.min);
      sw = new SacredCircle(centerPoint(delta, radiansForI(2)), threshold.min);
      s  = new SacredCircle(centerPoint(delta, radiansForI(3)), threshold.min);
      se = new SacredCircle(centerPoint(delta, radiansForI(4)), threshold.min);
      ne = new SacredCircle(centerPoint(delta, radiansForI(5)), threshold.min);
    }
  }
  
  void drawGeometry(SacredArduino arduino) {
    n.diameter = arduino.n;
    n.drawCircle(root);
    
    nw.diameter = arduino.nw;
    nw.drawCircle(sacral);
    
    sw.diameter = arduino.sw;
    sw.drawCircle(solar);
    
    s.diameter = arduino.s;
    s.drawCircle(heart);
    
    se.diameter = arduino.se;
    se.drawCircle(throat);
    
    ne.diameter = arduino.ne;
    ne.drawCircle(thirdeye);
  }
  
  private SacredPoint centerPoint(float radius, float radian) {
    float x = center.x + radius * cos(radian);
    float y = center.y + radius * sin(radian);
    return new SacredPoint(x, y);
  }

  private float radiansForI(int i) {
    return radians(degreesForI(i));
  }

  private float degreesForI(int i) {
    return (30.0 + (float(i+1) * 60.0)); // start at 90
  }
}