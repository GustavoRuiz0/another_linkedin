// authProvider.js
import axios from 'axios';
import { createContext, useContext, useEffect, useMemo, useState } from 'react';

const AuthContext = createContext();

const AuthProvider = ({ children }) => {
  const [token, setToken_] = useState(localStorage.getItem('token'));

  const setToken = (newToken) => {
    setToken_(newToken);
  };

  const isTokenExpired = (token) => {
    if (!token) return true;

    const jwtPayload = JSON.parse(atob(token.split('.')[1]));
    const expTime = jwtPayload.exp * 1000;
    const currentTime = Date.now();

    return currentTime > expTime;
  };

  useEffect(() => {
    if (token) {
      axios.defaults.headers.common['Authorization'] = 'Bearer ' + token;
      localStorage.setItem('token', token);

      if (isTokenExpired(token)) {
        setToken(null);
      }
    } else {
      delete axios.defaults.headers.common['Authorization'];
      localStorage.removeItem('token');
    }
  }, [token]);

  const contextValue = useMemo(
    () => ({
      token,
      setToken,
      isTokenExpired,
    }),
    [token]
  );

  return (
    <AuthContext.Provider value={contextValue}>{children}</AuthContext.Provider>
  );
};

export const useAuth = () => {
  return useContext(AuthContext);
};

export default AuthProvider;
