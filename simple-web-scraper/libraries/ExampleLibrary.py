# This example library provides one method: current_date
# Robot Framework maps the method name to a keyword: "Current date"

from datetime import date


class ExampleLibrary:
    def current_date(self):
        return date.today()
