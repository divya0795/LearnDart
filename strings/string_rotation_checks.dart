// Check whether b is a rotation of a: it must have the same length and
// appear inside a + a (e.g. "waterbottle" rotates to "erbottlewat").
bool isRotation(String a, String b) =>
    a.length == b.length && (a + a).contains(b);
