/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_utils_bonus.c                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lgerard <lgerard@student.42perpignan.fr    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/06 17:38:30 by lgerard           #+#    #+#             */
/*   Updated: 2024/12/20 15:38:58 by lgerard          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

char	*ft_strncpygnl(char *src, char *dst, int n, int way)
{
	int	i;

	i = 0;
	if (!src || !dst)
		return (0);
	while (i < n)
	{
		dst[i] = src[i];
		i++;
	}
	dst[i] = '\0';
	if (way == 1)
	{
		i = 0;
		while (src[i + n] != 0)
		{
			src[i] = src[i + n];
			i++;
		}
		while (src[i] != 0)
			src[i++] = 0;
	}
	return (dst);
}
