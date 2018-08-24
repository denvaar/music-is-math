## This is an experiment

This is an experiment to explore how music can be composed programmatically.

The overall goal that I have for this experiment is to be able to use Javascript Object Notation (JSON) to digitally compose and represent music.
This code relies on [SoX - Sound Exchange](http://sox.sourceforge.net/) to make noise. This dependency might be eliminated in the future.

### JSON Notation

```json
{
  "staff": {
    "tempo": 100,
    "ts": "4/4",
    "notes": [
      {
        "name": "quarter",
        "freq": ["c4", "e4", "f4"]
      },
      {
        "name": "quarter",
        "freq": "d4"
      },
      {
        "name": "quarter",
        "freq": "e4"
      },
      {
        "name": "quarter",
        "freq": "f4"
      },
      {
        "name": "quarter",
        "freq": "g4"
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
{
  "staff": {
    "tempo": 100,
    "notes": [
      { "type": "half", "freq": "a4" },
      { "type": "quarter", "freq": "a4" },
      { "type": "half", "freq": "e5" },
      { "type": "quarter", "freq": "e5" },
      { "type": "quarter", "freq": "b4" },
      { "type": "quarter", "freq": "c5" },
      { "type": "quarter", "freq": "b4" },
      { "type": "half", "freq": "a4" },
      { "type": "quarter", "freq": "0" },
      { "type": "quarter", "freq": "e5" },
      { "type": "quarter", "freq": "g5" },
      { "type": "half", "freq": "a5" },
      { "type": "quarter", "freq": "g5" },
      { "type": "quarter", "freq": "e5" }
    ]
  }
}
```
