
from flask_testing import LiveServerTestCase
from flask import Flask
import os
from flask_sqlalchemy import SQLAlchemy
import unittest
import urllib2

os.environ['SETTINGS'] = 'testing_settings.cfg'
from app import app
db = SQLAlchemy(app)

class MyTest(LiveServerTestCase):

    def create_app(self):

        return app

    def setUp(self):

        db.create_all()

    def tearDown(self):

        db.session.remove()
        db.drop_all()

    def test_server_is_up_and_running(self):
        response = urllib2.urlopen(self.get_server_url())
        self.assertEqual(response.code, 200)

if __name__ == '__main__':
    unittest.main()
