docker run -d \
  --name winccoa \
  --hostname winccoa \
  -v ~/shield.txt:/opt/WinCC_OA/3.16/shield.txt \
  -v /proj/DemoApplication_3.16:/proj/default \
  -p 5678:5678 \
  winccoa:3.16
