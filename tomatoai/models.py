from django.db import models

class Restaurant(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)
    address = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=15)
    email = models.EmailField(blank=True)
    recipes = models.ManyToManyField('Recipe', related_name='restaurants', blank=True)

    def __str__(self):
        return self.name
    


class Recipe(models.Model):
   name = models.CharField(max_length=255)
   description = models.TextField(blank=True)
   instructions = models.TextField(blank=True)
   ingredients = models.ManyToManyField('Ingredient', related_name='recipes', blank=True)

   def __str__(self):
     return self.name
   
  
class Ingredient(models.Model):
  name = models.CharField(max_length=255)
  description = models.TextField(blank=True)

  def __str__(self):
    return self.name
