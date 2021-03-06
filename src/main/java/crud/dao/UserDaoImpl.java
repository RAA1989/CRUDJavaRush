package crud.dao;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import crud.model.User;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    @Autowired
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User added: " + user.toString());
    }

    @Override
    public void updateuser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User info updated: " + user.toString());
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);

        if (user != null) {
            session.delete(user);
            logger.info("User deleted: " + user.toString());
        } else logger.info("Invalid id: " + id);
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);

        if (user != null) {
            logger.info("User: " + user.toString());
            return user;
        } else {
            logger.info("Invalid id: " + id);
            return null;
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> getAllUsersList() {
        Session session = sessionFactory.getCurrentSession();
        List<User> users = (List<User>) session.createQuery("from User").list();

        for (User user : users) {
            logger.info("User in list: " + user.toString());
        }
        return users;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> searchUsers(String name) {
        Session session = sessionFactory.getCurrentSession();
        Criteria criteria = session.createCriteria(User.class);
        if (name != null&&!name.isEmpty()) criteria.add(Restrictions.like("name", name));

        return criteria.list();
    }
}