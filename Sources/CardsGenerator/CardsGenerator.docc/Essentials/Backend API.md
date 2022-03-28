# Backend API

This article should give you overview what objects need to be tranformed as input from backend.

## Overview

**Card**
``` json
{
    "items": [
        {
            "id": ...
        }
    ],
    "timeStamp": 2154545515421;
    "answer": true/false
}
```
**Report**
``` json
{
    "cardList": [
        {
            "items": [
                {
                    "id": ...
                }
            ]
            "value": true/false
        },
        ...
    ],
    "timeStamp": 2154545515421
}
```
