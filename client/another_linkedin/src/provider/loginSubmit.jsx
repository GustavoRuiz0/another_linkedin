import { toast } from 'react-toastify';
import { useAuth } from './authProvider';
import { useNavigate } from 'react-router-dom';

const useLoginSubmit = () => {
  const { setToken } = useAuth();
  const navigate = useNavigate();

  const loginSubmit = async (credentials) => {
    try {
      const response = await fetch('/api/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ user: credentials }),
      });

      if (!response.ok) {
        throw new Error('Login failed');
      }

      const token = response.headers.get('Authorization').split(' ')[1];
      setToken(token);

      toast.success('Login Successful');
      navigate('/jobs');
    } catch (error) {
      toast.error('Login failed: ' + error.message);
    }
  };

  return loginSubmit;
};

export default useLoginSubmit;
