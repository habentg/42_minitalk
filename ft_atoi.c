/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hatesfam <hatesfam@student.abudhabi42.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/16 20:55:15 by hatesfam          #+#    #+#             */
/*   Updated: 2023/06/16 20:55:55 by hatesfam         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

static int	set_sign(char *str, int *sign, int i)
{
	int	c;

	c = 0;
	if (str[i] == '+' || str[i] == '-')
	{
		if (str[i] == '-')
			*sign = *sign * -1;
		c++;
	}
	return (c);
}

static int	ft_isdigit(int digit)
{
	if (digit >= '0' && digit <= '9')
		return (1);
	return (0);
}

int	ft_atoi(char *str)
{
	int		i;
	long	num;
	int		sign;

	i = 0;
	num = 0;
	sign = 1;
	while ((str[i] >= 9 && str[i] <= 13) || str[i] == 32)
		i++;
	i = i + set_sign(str, &sign, i);
	while (ft_isdigit(str[i]))
	{
		num = (num * 10) + (str[i] - '0');
		if (num * sign > 4194304)
			return (0);
		i++;
	}
	if (str[i] && !ft_isdigit(str[i]))
		return (0);
	return ((int)num * sign);
}
