# 동작 방식
```mermaid
flowchart LR
    c[Client]-- HTTPS -->n([Nginx])
    subgraph docker[docker]
    n([Nginx])
    end
    n([Nginx])-- REVERSE_PROXY -->H[Host:Port]

```