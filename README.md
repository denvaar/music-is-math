### JSON Notation

```
{
  staff: {
    tempo: 100,
    ts: "4/4",
    notes: [
      {
        name: "quarter",
        freq: ["c4", "e4", "f4"]
      },
      {
        name: "quarter",
        freq: "d4"
      },
      {
        name: "quarter",
        freq: "e4"
      },
      {
        name: "quarter",
        freq: "f4"
      },
      {
        name: "quarter",
        freq: "g4"
      },
    ]
  }
}
```

### Examples

### C4 Scale

```
{
  "staff": {
    "tempo": 100,
    "notes": [
      { "type": "quarter", "freq": "c4" },
      { "type": "quarter", "freq": "d4" },
      { "type": "quarter", "freq": "e4" },
      { "type": "quarter", "freq": "f4" },
      { "type": "quarter", "freq": "g4" },
      { "type": "quarter", "freq": "a4" },
      { "type": "quarter", "freq": "b4" },
      { "type": "quarter", "freq": "c5" },
      { "type": "quarter", "freq": "c5" },
      { "type": "quarter", "freq": "b4" },
      { "type": "quarter", "freq": "a4" },
      { "type": "quarter", "freq": "g4" },
      { "type": "quarter", "freq": "f4" },
      { "type": "quarter", "freq": "e4" },
      { "type": "quarter", "freq": "d4" },
      { "type": "quarter", "freq": "c4" },
      {
        "type": ["whole", "whole", "whole"],
        "freq": ["c4", "e4", "g4"]
      }
    ]
  }
}
```

### Twinkle, twinkle, little star

```
{
  "staff": {
    "tempo": 100,
    "notes": [
      { "type": "quarter", "freq": "c4" },
      { "type": "quarter", "freq": "c4" },
      { "type": "quarter", "freq": "g4" },
      { "type": "quarter", "freq": "g4" },
      { "type": "quarter", "freq": "a4" },
      { "type": "half",    "freq": "g4" },
      { "type": "quarter", "freq": "f4" },
      { "type": "quarter", "freq": "f5" },
      { "type": "quarter", "freq": "e5" },
      { "type": "quarter", "freq": "e4" },
      { "type": "quarter", "freq": "d4" },
      { "type": "quarter", "freq": "d4" },
      { "type": "half",    "freq": "c4" }
    ]
  }
}
```

Tempo is measured in quarter notes per minute (QPM.)
Synth.Sound.compose_many(1000, [["C2", "C3", "G3", "C4", "311.13", "G4"], ["92.50", "185", "207.65", "C4", "311.13", "415.30"]])
