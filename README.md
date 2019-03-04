# Noob
New retail recommendation system based face recognition
## Author: Noob
## Version:
## Development Environment:
system: ubuntu \
language: python3 \
database: mysql5
## Document
### file struction
- Noob
  - app    //-- project folder
    - main  //
      - DataAnalysis
      - FaceDetect  //
      - dbapi.py  // --databases operations api
      - webWin.py // --application entrance
    - models  // --databases operations
      - models.py  // --databases tables' class using SQLAlchemy (ORM)
      - mysql.py  // --original databases operations based on package of PyMysql
    - static  // --static resources
    - templates  //
    - __init__.py
  - migrations  // --database migrations
  - tests  // --unit test
  - config.py  // --config
  - manage.py  // --project management file
  - requirements.txt  // --requirement packages
### DateBases
