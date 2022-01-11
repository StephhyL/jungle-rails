require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user =
        User.create(
          first_name: 'Jen',
          last_name: 'Kim',
          email: 'people@sunny.com',
          password: '12345',
          password_confirmation: '12345',
        )
    end

    it 'valid with all necessary attributes' do
      expect(@user).to be_valid
    end

    it 'should have a valid first_name' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it 'should have a valid last_name' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it 'should have an email present' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it 'should have a unique email' do
      @user2 =
        User.create(
          first_name: 'Mickey',
          last_name: 'Mouse',
          email: 'PEOPLE@sunny.com',
          password: '12345',
          password_confirmation: '12345',
        )

      @user2.valid?
      expect(@user2.errors.full_messages).to_not be_empty
    end

    it 'should have entered the same thing for password and password confirmation' do
      @user.password_confirmation = '3243242342'
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it 'should have an inputted password' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it 'should have a password with a minimum length of 5 characters' do
      @user.password = '123'
      @user.password_confirmation = '123'
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user =
        User.create(
          first_name: 'Jen',
          last_name: 'Kim',
          email: 'people@sunny.com',
          password: '12345',
          password_confirmation: '12345',
        )
    end

    it 'should log user in with valid email/password combination' do
      email = 'people@sunny.com'
      password = '12345'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to eq(@user)
    end

    it 'should still be a valid email regardless of spaces around email' do
      email = '    people@sunny.com  '
      password = '12345'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to eq(@user)
    end

    it 'should still be a valid email regardless of character case' do
      email = ' PEOPLE@sunny.com  '
      password = '12345'

      @user2 = User.authenticate_with_credentials(email, password)

      expect(@user2).to eq(@user)
    end
  end
end
